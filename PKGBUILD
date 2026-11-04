# Maintainer: Your Name <your.email@example.com>
pkgname=gweather-add-loc-bin
pkgver=0.1.2
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
sha256sums=('dbb28097e8ecefa30b1118437a3731fe4498860495b6a218905eefd5f611854d')

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
