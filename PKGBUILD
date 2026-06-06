# Maintainer: mryll <https://github.com/mryll>
pkgname=tickerbar-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Multi-market price ticker for Waybar (crypto, stocks, indices, commodities, forex, rates) — no API key (prebuilt binary)'
arch=('x86_64')
url='https://github.com/mryll/tickerbar'
license=('MIT')
depends=('gcc-libs' 'openssl')
provides=('tickerbar')
conflicts=('tickerbar')
options=(!debug)
source=("tickerbar-${pkgver}::https://github.com/mryll/tickerbar/releases/download/v${pkgver}/tickerbar-${pkgver}-x86_64-linux"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/mryll/tickerbar/v${pkgver}/LICENSE")
sha256sums=('3bf0eff6af59bdabf0a6e9ae3e1eae0d5f5ac635f232836d9cdd9b25a48fb29d'
            'aa9f3a694508cadff239e4694992eac66611723af6ce8643e80ca5c7db8c9e4e')

package() {
    install -Dm755 "tickerbar-${pkgver}" "$pkgdir/usr/bin/tickerbar"
    install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
