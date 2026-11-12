# Maintainer: crian <crian84@gmail.com>
pkgname=gweather-add-loc-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Add custom locations with arbitrary coordinates to GNOME Weather (prebuilt binary)"
arch=('x86_64')
url="https://github.com/crian/gweather-add-loc"
license=('MIT')
depends=('gtk4' 'libadwaita')
optdepends=('gnome-weather: the weather application to add locations to'
            'flatpak: support for Flatpak installations of GNOME Weather')
provides=("${pkgname%-bin}=${pkgver}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/crian/gweather-add-loc/releases/download/v${pkgver}/gweather-add-loc-${pkgver}-x86_64-linux.tar.gz")
sha256sums=('2b1ba010da15250fae7f88e5ed7f302431d6115af9aa00883a55e2a6c69c6aa2')

package() {
    cd "$srcdir/gweather-add-loc-${pkgver}-x86_64-linux"

    install -Dm755 gweather-add-loc "$pkgdir/usr/bin/gweather-add-loc"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 data/io.github.crian.GWeatherAddLoc.desktop \
        "$pkgdir/usr/share/applications/io.github.crian.GWeatherAddLoc.desktop"
    install -Dm644 data/io.github.crian.GWeatherAddLoc.metainfo.xml \
        "$pkgdir/usr/share/metainfo/io.github.crian.GWeatherAddLoc.metainfo.xml"
    install -Dm644 data/icons/hicolor/scalable/apps/io.github.crian.GWeatherAddLoc.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.crian.GWeatherAddLoc.svg"
    install -Dm644 data/icons/hicolor/symbolic/apps/io.github.crian.GWeatherAddLoc-symbolic.svg \
        "$pkgdir/usr/share/icons/hicolor/symbolic/apps/io.github.crian.GWeatherAddLoc-symbolic.svg"
    install -Dm755 gweather-add-loc.sh "$pkgdir/usr/bin/gweather-add-loc.sh"
}
