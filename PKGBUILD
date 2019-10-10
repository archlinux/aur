# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=(freedm freedoom1 freedoom2)
pkgbase=freedoom
pkgver=0.12.0
pkgrel=1
pkgdesc="Free game based on the Doom engine"
arch=('any')
url="https://freedoom.github.io/"
license=('BSD')
makedepends=('asciidoc' 'deutex' 'python')
source=(https://github.com/$pkgbase/$pkgbase/releases/download/v$pkgver/$pkgbase-$pkgver.tar.xz)
sha512sums=('d05c4a3309db16b8e0cbcdf5841608e187de21d5feec3782700b66f7075ec513f9d3d375625f384f96704bb623d39636e61b5ca4f5d041a255249fdfda6cb150')

build() {
  cd "$pkgbase-$pkgver"

  make
}

package_freedm() {
  cd "$pkgbase-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install-freedm
}

package_freedoom1() {
  cd "$pkgbase-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install-freedoom1
}

package_freedoom2() {
  provides=('freedoom')

  cd "$pkgbase-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install-freedoom2
}
