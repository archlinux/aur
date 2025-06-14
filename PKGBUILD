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
b2sums=('c66b5ab9e64cf79189f5f55521d69f51488fe24ab4635cb2a75e5ee82189e5567fe07924d02de0014daeee8c226514e2be096504cb96d14a742dee4b1e617e7b')
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
