# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='clean-chroot-manager'
pkgver=2.86
pkgrel=1
pkgdesc='Wrapper scripts for managing clean chroots (64-bit and 32-bit).'
arch=('any')
url='https://github.com/graysky2/clean-chroot-manager'
license=('MIT')
depends=('devtools' 'rsync')
conflicts=('clean_chroot_manager')
replaces=('clean_chroot_manager')
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('6f9ecbf8061e82fdbbad9b1ec817ca2e943c50b4da56f33c2555bb2cb1a6535e')
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
