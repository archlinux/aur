# Maintainer: graysky <therealgraysky AT protonmail DOT com>

pkgname=clean-chroot-manager
pkgver=4.1
pkgrel=1
pkgdesc='Wrapper for managing clean chroot builds with local repo therein.'
arch=(any)
url='https://github.com/graysky2/clean-chroot-manager'
license=(MIT)
depends=(bc devtools diskus libarchive pacman rsync)
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/clean-chroot-manager/archive/v$pkgver.tar.gz")
b2sums=('0a6624ef079d624d8ce0d192357363f039699f51483b61239f57c7f9bb8004f960fde0638eda71ca5c17296aeefbb2736072bd0b47c33ec04993f9c14d6b6602')
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
