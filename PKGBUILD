# Maintainer: Axel Navarro <navarroaxel at gmail dot com>

_pkgname=vysor
pkgname=${_pkgname}-bin
pkgver=5.0.7
pkgrel=1
pkgdesc="Mirror and control your Android device"
arch=('x86_64')
url="https://vysor.io"
license=('custom')
provides=('vysor')
conflicts=('vysor')
source=("https://github.com/koush/vysor.io/releases/download/v$pkgver/Vysor-linux-$pkgver.deb")
sha256sums=('adf4a88c8d87d25d2e0ca6382afeea69712336668909250e2bb9a40d733cec77')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  install -d -m 755 "${pkgdir}/usr/bin"
  ln -s "/opt/Vysor/vysorapp" "${pkgdir}/usr/bin/vysorapp"
}
