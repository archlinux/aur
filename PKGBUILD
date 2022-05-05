# Maintainer: graysky <therealgraysky AT protonmail DOT com>

pkgname=clean-chroot-manager
pkgver=2.222
pkgrel=1
pkgdesc='Wrapper for managing clean chroot builds with local repo therein.'
arch=('any')
url='https://github.com/graysky2/clean-chroot-manager'
license=('MIT')
depends=('devtools>=20190821-1' 'rsync' 'libarchive>=3.3.3' 'pacman>=5.2')
conflicts=('clean_chroot_manager')
replaces=('clean_chroot_manager')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/clean-chroot-manager/archive/v$pkgver.tar.gz")
b2sums=('3a485e87fa06e7af4a14cd0c45748a810ec593abb33455de1608059a8335a1e0577bebb64cb46043f1600f1d88be125c0497f03534a3e130c5f07734a0f968b1')
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
