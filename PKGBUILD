# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=arcticfox-config-bin
pkgver=1.11.8
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
        "99-arcticfox.rules"
        "https://github.com/hobbyquaker/arcticfox-config/raw/master/icon.png"
)
md5sums=(
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
)

package() {
        mkdir -p "${pkgdir}/opt/"
        mv -v "${srcdir}/arcticfox-config-$pkgver"                "${pkgdir}/opt/Arcticfox Config"
        install -Dm644 "${srcdir}/arcticfox-config.desktop"       "${pkgdir}/usr/share/applications/arcticfox-config.desktop"
        install -Dm644 "${srcdir}/99-arcticfox.rules"             "${pkgdir}/etc/udev/rules.d/99-arcticfox.rules"

        mkdir -p "${pkgname}/usr/bin/"
        ln -svr "${pkgdir}/opt/Arcticfox Config/arcticfox-config" "${pkgname}/usr/bin/"

        mkdir -p "${pkgname}/usr/share/icons/hicolor/512x512/apps/"
        mv -v icon.png "${pkgname}/usr/share/icons/hicolor/512x512/apps/arcticfox-config.png"
}
