# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=minetime
pkgver=1.4.10
pkgrel=1
pkgdesc='MineTime is a modern, intuitive and smart calendar application.'
arch=('x86_64')
url='https://github.com/marcoancona/MineTime'
license=('custom')
depends=('libsecret' 'libxss')
source=(${url}/releases/download/v${pkgver}/MineTime_${pkgver}_amd64.deb
        minetime)
sha512sums=('95655fb2d807093d0c733f95b32072ccbe1edf4384d3e216af40b8dc27134de83c437fea71c1bbbf40187c945833db877cd59b4b0b04a08a48ecdfd25049a15f'
            'deec4ce019c404b59b7cbad520e837bbb086dc3286a326fe8b07ddd46162a81747269f0be05b8b5ba08621ecc9ed90df436ae6844cf8f3074f4576f0a098efa3')

package() {
    cd "${srcdir}"
    tar -xJC "${pkgdir}" -f data.tar.xz

    # Create /usr/bin for the executable
    mkdir "${pkgdir}/usr/bin"
    install -m 755 "${startdir}/minetime" "${pkgdir}/usr/bin/minetime"
}
