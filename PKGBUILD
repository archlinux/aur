# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=minetime
pkgver=1.4.3
pkgrel=1
pkgdesc='MineTime is a modern, intuitive and smart calendar application.'
arch=('x86_64')
url='https://github.com/marcoancona/MineTime'
license=('custom')
depends=('libsecret')
source=(${url}/releases/download/v${pkgver}/MineTime_${pkgver}_amd64.deb
        minetime)
sha512sums=('76bdee0e165ce5f115daaca084b4555cfa630536860c6be387affe43a87b4e7e89c1083e93892a1a0bbc6ce5bd986be0bc749716eed725ac81c02cdebab68eaa'
            'deec4ce019c404b59b7cbad520e837bbb086dc3286a326fe8b07ddd46162a81747269f0be05b8b5ba08621ecc9ed90df436ae6844cf8f3074f4576f0a098efa3')

package() {
    cd "${srcdir}"
    tar -xJC "${pkgdir}" -f data.tar.xz

    # Create /usr/bin for the executable
    mkdir "${pkgdir}/usr/bin"
    install -m 755 "${startdir}/minetime" "${pkgdir}/usr/bin/minetime"
}
