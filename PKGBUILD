# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=minetime-bin
pkgver=1.8.7
pkgrel=1
pkgdesc='MineTime is a modern, intuitive and smart calendar application'
arch=('x86_64')
url='https://github.com/marcoancona/MineTime'
license=('custom')
depends=('libsecret' 'libxss' 'dbus' 'hicolor-icon-theme' 'desktop-file-utils')
provides=('minetime')
source=("${url}/releases/download/v${pkgver}/MineTime_${pkgver}_amd64.deb"
        minetime)
b2sums=('929e08436a6c674599b6ae047a02a948d70a2f0ef254e541f0a3383821701dcc8f578c279b25d56071a054c77ad77eb46132f6c69257f8764ddf517a932771a5'
        '5d7b161312866c7093913428743bb8901c622cbd6d29e447bbd9ba70aea2972ceaf01263a285f78f8a39e6deee4f5d968ed96eee555e456eb3cd879c230ad02d')

package() {
  tar -xJC "${pkgdir}" -f data.tar.xz
  install -Dm 755 "${startdir}"/minetime "${pkgdir}"/usr/bin/minetime
}
