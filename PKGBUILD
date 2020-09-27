# Maintainer: Jimmy Xu <me at jimmyxu dot org>
# Contributor: chimeracoder <dev at chimeracoder dot net>

_perlmod='String-RewritePrefix'
_modnamespace=String
pkgname=perl-string-rewriteprefix
pkgver=0.008
pkgrel=1
pkgdesc="rewrite strings based on a set of known prefixes"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-sub-exporter')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=('e45a31d6914e8f5fc722ef48d8819400dafc02105e0c61414aabbf01bce208eb')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make test
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
