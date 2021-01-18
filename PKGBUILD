# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=minetime-bin
pkgver=1.9.4
pkgrel=1
pkgdesc='MineTime is a modern, intuitive and smart calendar application'
arch=('x86_64')
url='https://github.com/marcoancona/MineTime'
license=('custom')
depends=('libsecret' 'libxss' 'dbus' 'hicolor-icon-theme' 'desktop-file-utils')
provides=('minetime')
source=("${url}/releases/download/v${pkgver}/MineTime_${pkgver}_amd64.deb"
        minetime)
b2sums=('0eb699b7e506d1eef0ef217f443c41ab1443e87c8cf68591de22f6e954aad8507ddd6d898df595a1528f3656c065ce9a88ca5eb69fca059dea4f1e7ff2d0b087'
        '5d7b161312866c7093913428743bb8901c622cbd6d29e447bbd9ba70aea2972ceaf01263a285f78f8a39e6deee4f5d968ed96eee555e456eb3cd879c230ad02d')

package() {
  tar -xJC "${pkgdir}" -f data.tar.xz
  install -Dm 755 "${startdir}"/minetime "${pkgdir}"/usr/bin/minetime
}
