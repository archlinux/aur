# Maintainer: mryll <https://github.com/mryll>
pkgname=tickerbar-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Multi-market price ticker for Waybar (crypto, stocks, indices, forex) — no API key (prebuilt binary)'
arch=('x86_64')
url='https://github.com/mryll/tickerbar'
license=('MIT')
depends=('gcc-libs' 'openssl')
provides=('tickerbar')
conflicts=('tickerbar')
options=(!debug)
source=("tickerbar-${pkgver}::https://github.com/mryll/tickerbar/releases/download/v${pkgver}/tickerbar-${pkgver}-x86_64-linux"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/mryll/tickerbar/v${pkgver}/LICENSE")
sha256sums=('f5b7cdb0be445f1dd4faf61836efaf117f057d1c1957b164b7153ed02ca29075'
            'aa9f3a694508cadff239e4694992eac66611723af6ce8643e80ca5c7db8c9e4e')

package() {
    install -Dm755 "tickerbar-${pkgver}" "$pkgdir/usr/bin/tickerbar"
    install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
