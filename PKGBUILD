# Maintainer: graysky <therealgraysky AT protonmail DOT com>

pkgname=clean-chroot-manager
pkgver=3.01
pkgrel=1
pkgdesc='Wrapper for managing clean chroot builds with local repo therein.'
arch=(any)
url='https://github.com/graysky2/clean-chroot-manager'
license=(MIT)
depends=(devtools rsync libarchive pacman bc)
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/clean-chroot-manager/archive/v$pkgver.tar.gz")
b2sums=('94f3de2e7c64d47221e7ad2561a5277e5b548c6dad3741cf8ce7b9ce366696b79f9238cd9ad6606900179025def87172f1f9b2a5f1188283f7e2fda1bfee7fdf')
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
