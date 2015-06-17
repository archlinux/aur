# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-webservice-musicbrainz'
pkgver='0.93'
pkgrel='1'
pkgdesc="Web service API to MusicBrainz database"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor>=0.30' 'perl-uri>=1.35' 'perl-xml-libxml>=1.63' 'perl-libwww>=0' 'perl>=5.7.0')
makedepends=()
url='http://search.cpan.org/dist/WebService-MusicBrainz'
source=('http://search.cpan.org/CPAN/authors/id/B/BF/BFAIST/WebService-MusicBrainz-0.93.tar.gz')
md5sums=('120bdefa3fc317a44aa00a92bd29297c')
sha512sums=('52b61dc10dd406aafec3eaac01aa7cebd240176bc3ef10fd00be543b146ac23ef8f90ec6c1bab37ea5440292cf3fd9f599bc0df92a09d749f3df4f7c546ac2c8')
_distdir="WebService-MusicBrainz-0.93"

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
