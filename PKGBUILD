# Maintainer: Pieter Lenaerts <pieter dot aj dot lenaerts at gmail>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-webservice-musicbrainz0'
pkgver='0.94'
pkgrel='1'
pkgdesc="Web service API to MusicBrainz database, pre-1.0 version."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor>=0.30' 'perl-uri>=1.35' 'perl-xml-libxml>=1.63' 'perl-libwww>=0' 'perl>=5.7.0')
makedepends=()
conflicts=('perl-webservice-musicbrainz')
url='http://search.cpan.org/dist/WebService-MusicBrainz'
source=("http://search.cpan.org/CPAN/authors/id/B/BF/BFAIST/WebService-MusicBrainz-$pkgver.tar.gz")
md5sums=('c6c2e0c1e512482fd17330c41883342f')
sha512sums=('4c73aa4e1407bb17567e0ad618771ffae47aa87925ef516640af6bb16e4dde2657a5c16bfa2dea2379b67812a2eee253d0642e4b2d73d43929d031f5917e51f0')
_distdir="WebService-MusicBrainz-$pkgver"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
