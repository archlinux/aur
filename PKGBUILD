# Maintainer: Antoine Damhet <antoine.damhet@lse.epita.fr>

pkgname=brightnessctl
pkgver=0.3.2
pkgrel=1
pkgdesc="Lightweight brightness control tool"
arch=('i686' 'x86_64')
url='https://github.com/Hummer12007/brightnessctl'
license=('MIT')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/Hummer12007/brightnessctl/archive/$pkgver.tar.gz"
)
sha256sums=('92687d8739b8395cf942287bdb8905a78b428102ab6029680829ab917363e0ab')
install='brightnessctl.install'

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver
  make UDEVDIR="/usr/lib/udev/rules.d" INSTALL_UDEV_RULES=1 DESTDIR="$pkgdir" install

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -m 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
