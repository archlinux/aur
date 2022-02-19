# Maintainer: Axel Navarro <navarroaxel at gmail dot com>

_pkgname=vysor
pkgname=${_pkgname}-bin
pkgver=4.1.77
pkgrel=2
pkgdesc="Mirror and control your Android device"
arch=('x86_64')
url="https://vysor.io"
license=('custom')
provides=('vysor')
conflicts=('vysor')
source=("https://github.com/koush/vysor.io/releases/download/v$pkgver/Vysor-linux-$pkgver.deb")
sha256sums=('8b2b51750407d505fad82d980bc5db163f2ff14e6fb72512621e166523b624cc')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  install -d -m 755 "${pkgdir}/usr/bin"
  ln -s "/opt/Vysor/vysorapp" "${pkgdir}/usr/bin/vysorapp"
}
