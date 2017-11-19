# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname=perl-webservice-musicbrainz
_pkgname=WebService-MusicBrainz
pkgver=1.0.2
pkgrel=1
pkgdesc="Web service API to MusicBrainz database"
arch=('any')
url="http://search.cpan.org/dist/WebService-MusicBrainz"
license=('PerlArtistic' 'GPL')
depends=('perl-class-accessor>=0.30' 'perl-uri>=1.35' 'perl-xml-libxml>=1.63' 'perl-libwww>=0' 'perl>=5.7.0')
provides=('perl-webservice-musicbrainz')
conflicts=('perl-webservice-musicbrainz' 'perl-webservice-musicbrainz0')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/B/BF/BFAIST/${_pkgname}-${pkgver}.tar.gz")
md5sums=('b2a32e931788c50bcd0e855880ee54e3')
sha512sums=('fc5f2744ad52d01e671c6dfcf011c334762f3655d200e47ab8aa48752755a74530f854870961243e2ccea727b287df549fbebe579c6ca5bb70d94edf5c508ce6')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/${_pkgname}-${pkgver}"
    /usr/bin/perl Makefile.PL
    make
  )
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
