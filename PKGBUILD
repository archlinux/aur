# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=arcticfox-config-bin
pkgver=1.11.10
pkgrel=1
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
md5sums=(
        'SKIP'
        'SKIP'
        'SKIP'
)

package() {
        mkdir -p "${pkgdir}/opt/"
        mv -v "${srcdir}/arcticfox-config-$pkgver"                "${pkgdir}/opt/Arcticfox Config"

        install -Dm644 "${srcdir}/arcticfox-config.desktop"       "${pkgdir}/usr/share/applications/arcticfox-config.desktop"

        mkdir -p "${pkgdir}/usr/bin/"
        ln -svrf "${pkgdir}/opt/Arcticfox Config/arcticfox-config" "${pkgdir}/usr/bin/arcticfox-config"

        install -vDm644 icon.png "${pkgname}/usr/share/icons/hicolor/512x512/apps/arcticfox-config.png"
}
