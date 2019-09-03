# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=minetime-bin
pkgver=1.6.1
pkgrel=1
pkgdesc='MineTime is a modern, intuitive and smart calendar application.'
arch=('x86_64')
url='https://github.com/marcoancona/MineTime'
license=('custom')
depends=('libsecret' 'libxss')
conflicts=('minetime')
replaces=('minetime')
source=(${url}/releases/download/v${pkgver}/MineTime_${pkgver}_amd64.deb
        minetime)
sha512sums=('62687a387f4496cc835701fde38f614d5cea713d360e6459a772e2d829ba6b62e6be38df2cc2081c4b3d646b411b8b2c5d0d13af6bafa5e1e129dd0dbd4e4781'
            'deec4ce019c404b59b7cbad520e837bbb086dc3286a326fe8b07ddd46162a81747269f0be05b8b5ba08621ecc9ed90df436ae6844cf8f3074f4576f0a098efa3')

package() {
    cd "${srcdir}"
    tar -xJC "${pkgdir}" -f data.tar.xz
    install -Dm 755 "${startdir}/minetime" "${pkgdir}/usr/bin/minetime"
}
