# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='clean-chroot-manager'
pkgver=2.79
pkgrel=1
pkgdesc='Wrapper scripts for managing clean chroots (64-bit and 32-bit).'
arch=('any')
url='https://github.com/graysky2/clean-chroot-manager'
license=('MIT')
depends=('devtools' 'rsync')
conflicts=('clean_chroot_manager')
replaces=('clean_chroot_manager')
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('f49d564ddecbb490d61b7c21f808e69a5250c606f7cd5cca26d03271e64e5d21')
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
