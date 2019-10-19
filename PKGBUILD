# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=clean-chroot-manager
pkgver=2.100
pkgrel=1
pkgdesc='Wrapper for managing clean chroot builds with local repo therein.'
arch=('any')
url='https://github.com/graysky2/clean-chroot-manager'
license=('MIT')
depends=('devtools>=20190821-1' 'rsync' 'libarchive>=3.3.3' 'pacman<5.2')
conflicts=('clean_chroot_manager')
replaces=('clean_chroot_manager')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/clean-chroot-manager/archive/v$pkgver.tar.gz")
sha256sums=('a3cf4d42bcd62377ec73e1dac735f8786e00fc1938727aed75b3dcb5eb6f6a07')
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
