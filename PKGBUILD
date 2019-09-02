# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=minetime-bin
pkgver=1.6.0
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
sha512sums=('ca7d7240e513316297459b0d42a3af22ad66e2a863e155fff1a6aef392133e6277f11c16a76d88da520e8c1c1755d22c7c90df1822a05042df899242923111c6'
            'deec4ce019c404b59b7cbad520e837bbb086dc3286a326fe8b07ddd46162a81747269f0be05b8b5ba08621ecc9ed90df436ae6844cf8f3074f4576f0a098efa3')

package() {
    cd "${srcdir}"
    tar -xJC "${pkgdir}" -f data.tar.xz
    install -Dm 755 "${startdir}/minetime" "${pkgdir}/usr/bin/minetime"
}
