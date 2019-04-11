# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=minetime
pkgver=1.5.0
pkgrel=1
pkgdesc='MineTime is a modern, intuitive and smart calendar application.'
arch=('x86_64')
url='https://github.com/marcoancona/MineTime'
license=('custom')
depends=('libsecret' 'libxss')
source=(${url}/releases/download/v${pkgver}/MineTime_${pkgver}_amd64.deb
        minetime)
sha512sums=('04e3774ed5cbe5d439e0b0b0da344235e1f5f7a0875836b01a613cddd66a72874214f81dccae23555b70d6f893fec803e7211e25ad6111063042d6037b295564'
            'deec4ce019c404b59b7cbad520e837bbb086dc3286a326fe8b07ddd46162a81747269f0be05b8b5ba08621ecc9ed90df436ae6844cf8f3074f4576f0a098efa3')

package() {
    cd "${srcdir}"
    tar -xJC "${pkgdir}" -f data.tar.xz

    # Create /usr/bin for the executable
    mkdir "${pkgdir}/usr/bin"
    install -m 755 "${startdir}/minetime" "${pkgdir}/usr/bin/minetime"
}
