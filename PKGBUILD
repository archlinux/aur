# Maintainer: graysky <therealgraysky AT protonmail DOT com>

pkgname=clean-chroot-manager
pkgver=3.0
pkgrel=1
pkgdesc='Wrapper for managing clean chroot builds with local repo therein.'
arch=(any)
url='https://github.com/graysky2/clean-chroot-manager'
license=(MIT)
depends=(devtools rsync libarchive pacman bc)
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/clean-chroot-manager/archive/v$pkgver.tar.gz")
b2sums=('71b12a8f88f55f800f73b7294067475fbee63eeaedd51513389d25d529a1178543a73f4eb6101f58318822cb270909d9d680d254a37c614749c00c0fe7ef88a3')
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
