# Maintainer: Quentin Bouvet <qbouvet at outlook dot com>
pkgname=nrf-udev
pkgver=1.0.1
pkgrel=1
pkgdesc="udev rules for nRF (Nordic Semiconductor) development kits"
arch=('any')
url="https://github.com/NordicSemiconductor/nrf-udev"
license=('Commercial')

source=("$pkgname-$pkgver::https://github.com/NordicSemiconductor/nrf-udev/archive/v${pkgver}.tar.gz")
sha256sums=("ee00fbd3247bc851f3a315e12825933ce953b0673b1f41c1a5cbace493fae7b5")

install=${pkgname}.install

package() {
  mkdir -p "$pkgdir/usr/lib/udev/rules.d/"
  install -D --mode=644 --owner="root" --group="root" \
    -t "$pkgdir/usr/lib/udev/rules.d/" \
    "$srcdir/$pkgname-$pkgver/nrf-udev_1.0.1-all/lib/udev/rules.d"/*
}

#
# makepkg --printsrcinfo > .SRCINFO
#
