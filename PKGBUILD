# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=minetime-bin
pkgver=1.7.3
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
sha512sums=('edda22d0c433e58e67e993beb1f5469ffd0c38804ce3084b035363395a9ec06c6bd627851a6e006fecb26f2916577dff5807642d15262affaa132a5aaf82aa6d'
            'deec4ce019c404b59b7cbad520e837bbb086dc3286a326fe8b07ddd46162a81747269f0be05b8b5ba08621ecc9ed90df436ae6844cf8f3074f4576f0a098efa3')

package() {
  tar -xJC "${pkgdir}" -f data.tar.xz
  install -Dm 755 "${startdir}"/minetime "${pkgdir}"/usr/bin/minetime
}
