# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=minetime-bin
pkgver=1.6.4
pkgrel=1
pkgdesc='MineTime is a modern, intuitive and smart calendar application.'
arch=('x86_64')
url='https://github.com/marcoancona/MineTime'
license=('custom')
depends=('libsecret' 'libxss' 'dbus' 'hicolor-icon-theme' 'desktop-file-utils')
conflicts=('minetime')
replaces=('minetime')
source=(${url}/releases/download/v${pkgver}/MineTime_${pkgver}_amd64.deb
        minetime)
sha512sums=('8381a2ee73837adfe2e1cdd5acba9badd214e236ee10b894feab76f2a3c1cabbe068f4ac5ac638e598dd90bb0ecd37c8437e2fe9f03af37f9dc8fac79368e688'
            'deec4ce019c404b59b7cbad520e837bbb086dc3286a326fe8b07ddd46162a81747269f0be05b8b5ba08621ecc9ed90df436ae6844cf8f3074f4576f0a098efa3')

package() {
  tar -xJC "${pkgdir}" -f data.tar.xz
  install -Dm 755 "${startdir}"/minetime "${pkgdir}"/usr/bin/minetime
}
