# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname=perl-webservice-musicbrainz
_pkgname=WebService-MusicBrainz
pkgver=1.0.5
pkgrel=1
pkgdesc="Web service API to MusicBrainz database"
arch=('any')
url="http://search.cpan.org/dist/WebService-MusicBrainz"
license=('PerlArtistic' 'GPL')
depends=('perl-class-accessor>=0.30' 'perl-uri>=1.35' 'perl-xml-libxml>=1.63' 'perl-libwww>=0' 'perl>=5.7.0' 'perl-mojolicious')
provides=('perl-webservice-musicbrainz')
conflicts=('perl-webservice-musicbrainz' 'perl-webservice-musicbrainz0')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/B/BF/BFAIST/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('b1dfa497b460fb56702905518d3f2de0f5af0f4003be9ce983954673b0abc8a67215a77079a2989fca2c0228409788ff3f767302659003f544e6bbd56ab6df24')

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
