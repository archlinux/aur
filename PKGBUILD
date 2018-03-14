# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=arcticfox-monitor-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple device monitoring tool for vape battery mods with Arcticfox firmware. cloud chart_with_upwards_trend Works on macOS and Linux."
arch=('any')
url="https://github.com/hobbyquaker/arcticfox-monitor"
license=('GPL3')
depends=()
makedepends=()
install=$pkgname.install
source=(
        "https://github.com/hobbyquaker/arcticfox-monitor/releases/download/v$pkgver/arcticfox-monitor-$pkgver.tar.gz"
        "arcticfox-monitor.desktop"
        "https://github.com/hobbyquaker/arcticfox-config/raw/master/icon.png"
)
md5sums=(
        'SKIP'
        'SKIP'
        'SKIP'
)

package() {
        mkdir -p "${pkgdir}/opt/"
        mv -v "${srcdir}/arcticfox-monitor-$pkgver"                "${pkgdir}/opt/Arcticfox Monitor"

        install -Dm644 "${srcdir}/arcticfox-monitor.desktop"       "${pkgdir}/usr/share/applications/arcticfox-monitor.desktop"

        mkdir -p "${pkgdir}/usr/bin/"
        ln -svrf "${pkgdir}/opt/Arcticfox Monitor/arcticfox-monitor" "${pkgdir}/usr/bin/arcticfox-monitor"

        mkdir -p "${pkgname}/usr/share/icons/hicolor/512x512/apps/"
        mv -v icon.png "${pkgname}/usr/share/icons/hicolor/512x512/apps/arcticfox-monitor.png"
}
