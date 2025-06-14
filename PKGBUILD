# Maintainer: graysky <therealgraysky AT protonmail DOT com>

pkgname=clean-chroot-manager
pkgver=2.235
pkgrel=1
pkgdesc='Wrapper for managing clean chroot builds with local repo therein.'
arch=(any)
url='https://github.com/graysky2/clean-chroot-manager'
license=(MIT)
depends=('devtools>=1:1.0.0-1' rsync 'libarchive>=3.3.3' 'pacman>=7.0.0-1' bc)
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/clean-chroot-manager/archive/v$pkgver.tar.gz")
b2sums=('0fed92c8cc39b6c2c0cff935f3fc3aff744008dcc7b270beecbfa25ee4f68692e05c8e200f6c20e5301e58b6e48b8e30c32f40328e6356e0a301155db51d9423')
install=ccm.install

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
