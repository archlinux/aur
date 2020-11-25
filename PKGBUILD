# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname=perl-webservice-musicbrainz
_pkgname=WebService-MusicBrainz
pkgver=1.0.5
pkgrel=1
pkgdesc="Web service API to MusicBrainz database"
arch=(any)
url="https://metacpan.org/release/WebService-MusicBrainz"
license=('PerlArtistic' 'GPL')
depends=(perl-class-accessor perl-uri perl-xml-libxml perl-libwww perl-mojolicious)
conflicts=(perl-webservice-musicbrainz0)
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


