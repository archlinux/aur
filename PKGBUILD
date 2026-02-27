# Maintainer: mryll <https://github.com/mryll>
pkgname=meteobar-bin
pkgver=0.1.3
pkgrel=1
pkgdesc='Weather widget for Waybar using Open-Meteo — no API key required (prebuilt binary)'
arch=('x86_64')
url='https://github.com/mryll/meteobar'
license=('MIT')
depends=('gcc-libs' 'openssl')
optdepends=('otf-font-awesome: Font Awesome icon set (--icons fontawesome)')
provides=('meteobar')
conflicts=('meteobar')
source=("meteobar-${pkgver}::https://github.com/mryll/meteobar/releases/download/v${pkgver}/meteobar-${pkgver}-x86_64-linux"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/mryll/meteobar/v${pkgver}/LICENSE")
sha256sums=('1085d94e633122002436c0cca2eb00de4cfbd3b6b7a94adb497bde76a9d8c6fe'
            'aa9f3a694508cadff239e4694992eac66611723af6ce8643e80ca5c7db8c9e4e')

package() {
    install -Dm755 "meteobar-${pkgver}" "$pkgdir/usr/bin/meteobar"
    install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
