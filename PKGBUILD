# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=minetime-bin
pkgver=1.6.3
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
sha512sums=('e4bbf227074357259fc9b1f3aa90dc0ab0d520cc0c25ffa5d5d1797a3c4defe25dcf15ca88e2e2192dfbf6b78bd29f7b64d6a615f50d9001b2711b4989c458f3'
            'deec4ce019c404b59b7cbad520e837bbb086dc3286a326fe8b07ddd46162a81747269f0be05b8b5ba08621ecc9ed90df436ae6844cf8f3074f4576f0a098efa3')

package() {
    cd "${srcdir}"
    tar -xJC "${pkgdir}" -f data.tar.xz
    install -Dm 755 "${startdir}/minetime" "${pkgdir}/usr/bin/minetime"
}
