# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=minetime-bin
pkgver=1.7.1
pkgrel=1
pkgdesc='MineTime is a modern, intuitive and smart calendar application.'
arch=('x86_64')
url='https://github.com/marcoancona/MineTime'
license=('custom')
depends=('libsecret' 'libxss' 'dbus' 'hicolor-icon-theme' 'desktop-file-utils')
conflicts=('minetime')
replaces=('minetime')
source=("${url}/releases/download/v${pkgver}/MineTime_${pkgver}_amd64.deb"
        minetime)
sha512sums=('fbda916dfb04663c077c1eeb62e497f647fe156d9c99cd05c30b0a098701c4ac3c2d32ae592baa38c9610ac5fbc54df36af8ae4650954ed92dbc33994258435c'
            'deec4ce019c404b59b7cbad520e837bbb086dc3286a326fe8b07ddd46162a81747269f0be05b8b5ba08621ecc9ed90df436ae6844cf8f3074f4576f0a098efa3')

package() {
  tar -xJC "${pkgdir}" -f data.tar.xz
  install -Dm 755 "${startdir}"/minetime "${pkgdir}"/usr/bin/minetime
}
