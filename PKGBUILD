# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=clean-chroot-manager
pkgver=2.91
pkgrel=1
pkgdesc='Wrapper scripts for managing clean chroots.'
arch=('any')
url='https://github.com/graysky2/clean-chroot-manager'
license=('MIT')
depends=('devtools>=20180528-1' 'rsync')
conflicts=('clean_chroot_manager')
replaces=('clean_chroot_manager')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/clean-chroot-manager/archive/v$pkgver.tar.gz")
sha256sums=('8fc12f64c6d260b3bd77f8ced79ff0f900ae57c563329b5c67e08b7bcbfd439f')
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
