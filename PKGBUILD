# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=minetime
pkgver=1.4.4
pkgrel=1
pkgdesc='MineTime is a modern, intuitive and smart calendar application.'
arch=('x86_64')
url='https://github.com/marcoancona/MineTime'
license=('custom')
depends=('libsecret' 'libxss')
source=(${url}/releases/download/v${pkgver}/MineTime_${pkgver}_amd64.deb
        minetime)
sha512sums=('5c1ed8418c36601c476430454f2f685f5243a1ff29207350fbc7f492095c70dd84ab1ba086c716453d8b6f6154ded8afdc8e752be146487ed821d7f0322af068'
            'deec4ce019c404b59b7cbad520e837bbb086dc3286a326fe8b07ddd46162a81747269f0be05b8b5ba08621ecc9ed90df436ae6844cf8f3074f4576f0a098efa3')

package() {
    cd "${srcdir}"
    tar -xJC "${pkgdir}" -f data.tar.xz

    # Create /usr/bin for the executable
    mkdir "${pkgdir}/usr/bin"
    install -m 755 "${startdir}/minetime" "${pkgdir}/usr/bin/minetime"
}
