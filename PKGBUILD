# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=minetime
pkgver=1.4.5
pkgrel=1
pkgdesc='MineTime is a modern, intuitive and smart calendar application.'
arch=('x86_64')
url='https://github.com/marcoancona/MineTime'
license=('custom')
depends=('libsecret' 'libxss')
source=(${url}/releases/download/v${pkgver}/MineTime_${pkgver}_amd64.deb
        minetime)
sha512sums=('36aa184b95816e9108b413df5681c889723573938855f2258ea5a0c4098e70f2c57ad0493477c6bc8404f6ac0ca2768fd43acadb73bfe4232741fb16bfafe18d'
            'deec4ce019c404b59b7cbad520e837bbb086dc3286a326fe8b07ddd46162a81747269f0be05b8b5ba08621ecc9ed90df436ae6844cf8f3074f4576f0a098efa3')

package() {
    cd "${srcdir}"
    tar -xJC "${pkgdir}" -f data.tar.xz

    # Create /usr/bin for the executable
    mkdir "${pkgdir}/usr/bin"
    install -m 755 "${startdir}/minetime" "${pkgdir}/usr/bin/minetime"
}
