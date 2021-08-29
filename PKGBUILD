# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=clean-chroot-manager
pkgver=2.220
pkgrel=1
pkgdesc='Wrapper for managing clean chroot builds with local repo therein.'
arch=('any')
url='https://github.com/graysky2/clean-chroot-manager'
license=('MIT')
depends=('devtools>=20190821-1' 'rsync' 'libarchive>=3.3.3' 'pacman>=5.2')
conflicts=('clean_chroot_manager')
replaces=('clean_chroot_manager')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/clean-chroot-manager/archive/v$pkgver.tar.gz")
b2sums=('f598bc5939466cefee0a1c4d97b0cd74a07607433fd861c34abc0ab02dc57cac751d6df9ead4dc8f75de9cf72bdc7316f4a51da0a0ae27d9a9f9174a5ceafa58')
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
