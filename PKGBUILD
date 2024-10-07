# Maintainer: Tom Manion atypicalmail at protonmail d0t com
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Andrew Rabert <draje@nullsum.net>

pkgname=perl-linux-fd
_perl_version=5.40
pkgver=0.016
pkgrel=5
pkgdesc="Provides you Linux specific special file handles"
arch=('any')
url="http://search.cpan.org/dist/Linux-FD"
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-params-util' 'perl-module-build' 'perl-sub-exporter' 'perl-test-exception')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Linux-FD-$pkgver.tar.gz")
sha256sums=('25204ff2ee679e22641d2dd6e9a30ab1d9ab1ffe972e8e05a2f823f1ccdbecec')

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
