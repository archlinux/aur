# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=minetime-bin
pkgver=1.6.2
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
sha512sums=('77e36e4c82319aac431a1a072c2796edf2d249ae41db9053e123e77cc2985b9ed0d36d9eaebb2626f34cbdd67be081abaabfb4c02b8d6408232d242c4d4b57b7'
            'deec4ce019c404b59b7cbad520e837bbb086dc3286a326fe8b07ddd46162a81747269f0be05b8b5ba08621ecc9ed90df436ae6844cf8f3074f4576f0a098efa3')

package() {
    cd "${srcdir}"
    tar -xJC "${pkgdir}" -f data.tar.xz
    install -Dm 755 "${startdir}/minetime" "${pkgdir}/usr/bin/minetime"
}
