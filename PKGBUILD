# Maintainer: mryll <https://github.com/mryll>
pkgname=meteobar-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Weather widget for Waybar using Open-Meteo — no API key required (prebuilt binary)'
arch=('x86_64')
url='https://github.com/mryll/meteobar'
license=('MIT')
depends=('gcc-libs' 'openssl')
optdepends=('otf-font-awesome: Font Awesome icon set (--icons fontawesome)'
            'ttf-jetbrains-mono-nerd: aligned framed tooltip (--frame)')
provides=('meteobar')
conflicts=('meteobar')
options=(!debug)
source=("meteobar-${pkgver}::https://github.com/mryll/meteobar/releases/download/v${pkgver}/meteobar-${pkgver}-x86_64-linux"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/mryll/meteobar/v${pkgver}/LICENSE")
sha256sums=('0e2ba708ed60ba94471a3e3ae5c3d38cdff6ff436bbeca2f6a925ab81cdceb9a'
            'aa9f3a694508cadff239e4694992eac66611723af6ce8643e80ca5c7db8c9e4e')

package() {
    install -Dm755 "meteobar-${pkgver}" "$pkgdir/usr/bin/meteobar"
    install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
