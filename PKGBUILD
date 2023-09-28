# Maintainer:  Courtney Swagar <distorto@member.fsf.org>
# Contributor: Pieter Lenaerts <pieter dot aj dot lenaerts at gmail>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-webservice-musicbrainz0'
pkgver='1.0.6'
pkgrel='1'
pkgdesc="Web service API to MusicBrainz database."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor>=0.30' 'perl-uri>=1.35' 'perl-xml-libxml>=1.63' 'perl-libwww>=0' 'perl>=5.7.0')
makedepends=()
conflicts=('perl-webservice-musicbrainz')
url='https://metacpan.org/dist/WebService-MusicBrainz'
source=("https://cpan.metacpan.org/authors/id/B/BF/BFAIST/WebService-MusicBrainz-$pkgver.tar.gz")
md5sums=('d290c0c905521b84d32061636944b196')
sha512sums=('b9cb8a4873c0a32575afbeaa57068a2b533dd3213d747b3577a378da2844b325e9b50477ccb3c5461b34a319078a59cf802be93f1cc094cb6f12c13c92c9611a')
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
