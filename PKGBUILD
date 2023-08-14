# Maintainer: Tom Manion atypicalmail at protonmail d0t com
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Andrew Rabert <draje@nullsum.net>

pkgname=perl-linux-fd
_perl_version=5.38
pkgver=0.011
pkgrel=5
pkgdesc="Provides you Linux specific special file handles"
arch=('any')
url="http://search.cpan.org/dist/Linux-FD"
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-params-util' 'perl-module-build' 'perl-sub-exporter' 'perl-test-exception')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Linux-FD-$pkgver.tar.gz")
sha256sums=('6bb579d47644cb0ed35626ff77e909ae69063073c6ac09aa0614fef00fa37356')

build() {
  cd Linux-FD-$pkgver
  perl ./Build.PL
}

check() {
  cd Linux-FD-$pkgver
  ./Build test
}

package() {
  cd Linux-FD-$pkgver
  ./Build install --install_base="."
  mkdir -p "$pkgdir/usr/lib/perl5/$_perl_version/vendor_perl"
  cp -r ./lib/perl5/*/* "$pkgdir/usr/lib/perl5/$_perl_version/vendor_perl"
}
