# Maintainer: Antoine Damhet <antoine.damhet@lse.epita.fr>

pkgname=brightnessctl
pkgver=0.3.1
pkgrel=2
pkgdesc="Lightweight brightness control tool"
arch=('i686' 'x86_64')
url='https://github.com/Hummer12007/brightnessctl'
license=('MIT')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/Hummer12007/brightnessctl/archive/$pkgver.tar.gz"
)
sha256sums=(
  '3e81dfa7c5faba29df88a7c4569c7ebaf511c3de4d489a8c8e305ab51b9e3059'
)
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
