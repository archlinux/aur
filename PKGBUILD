# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=arcticfox-config-bin
pkgver=1.11.10
pkgrel=3
pkgdesc="Configuration Tool for Vape Battery Mods with Arcticfox Firmware. Works on MacOS and Linux."
arch=('any')
url="https://github.com/hobbyquaker/arcticfox-config"
license=('GPL3')
depends=()
makedepends=()
install=$pkgname.install
source=(
        "https://github.com/hobbyquaker/arcticfox-config/releases/download/v$pkgver/arcticfox-config-$pkgver.tar.gz"
        "arcticfox-config.desktop"
        "https://github.com/hobbyquaker/arcticfox-config/raw/master/icon.png"
)
sha512sums=('f6c163832ad3cce28bdd356254bec4b18df91da77ee18ef56c5fab4cdee9360af1ce28aa1aed26ef5661855c1f229c68e670b832e4dc910b46c797350734d4bd'
            '3e64e7eb8b7fb49c3bd2b5f2891888d3914bb2a878a0e256c9fab3712e509691f4817c2bf15fd2de0870b1fb1e2810fca20f193c6bea846cdda664be0124a062'
            '01f1988f098de1075285870b458cfb36838af712961eef35ba27b34a6b13ba77ff353e637975dcad796cfdb30392136f00a43ea596aa8d514189df09ee8aa36f')

package() {
        mkdir -p "${pkgdir}/opt/"
        mv -v "${srcdir}/arcticfox-config-$pkgver"                "${pkgdir}/opt/Arcticfox Config"

        install -Dm644 "${srcdir}/arcticfox-config.desktop"       "${pkgdir}/usr/share/applications/arcticfox-config.desktop"

        mkdir -p "${pkgdir}/usr/bin/"
        ln -svrf "${pkgdir}/opt/Arcticfox Config/arcticfox-config" "${pkgdir}/usr/bin/arcticfox-config"

        install -vDm644 icon.png "${pkgname}/usr/share/icons/hicolor/512x512/apps/arcticfox-config.png"
}
