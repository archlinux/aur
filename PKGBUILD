# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=minetime-bin
pkgver=1.8.8
pkgrel=1
pkgdesc='MineTime is a modern, intuitive and smart calendar application'
arch=('x86_64')
url='https://github.com/marcoancona/MineTime'
license=('custom')
depends=('libsecret' 'libxss' 'dbus' 'hicolor-icon-theme' 'desktop-file-utils')
provides=('minetime')
source=("${url}/releases/download/v${pkgver}/MineTime_${pkgver}_amd64.deb"
        minetime)
b2sums=('59e8f1878d8ef602d8ba98feb3e4a8cdcf3cc9d4d21404d91152933c66931d28919ed10525ddd717c93086b06bc5a534bb822fbd25926758bef8d98faff3ae78'
        '5d7b161312866c7093913428743bb8901c622cbd6d29e447bbd9ba70aea2972ceaf01263a285f78f8a39e6deee4f5d968ed96eee555e456eb3cd879c230ad02d')

package() {
  tar -xJC "${pkgdir}" -f data.tar.xz
  install -Dm 755 "${startdir}"/minetime "${pkgdir}"/usr/bin/minetime
}
