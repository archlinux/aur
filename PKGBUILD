# Maintainer: mryll <https://github.com/mryll>
pkgname=tickerbar-bin
pkgver=0.6.0
pkgrel=1
pkgdesc='Multi-market price ticker for Waybar (crypto, stocks, indices, commodities, forex, rates) — no API key (prebuilt binary)'
arch=('x86_64')
url='https://github.com/mryll/tickerbar'
license=('MIT')
depends=('gcc-libs' 'openssl')
optdepends=('ttf-jetbrains-mono-nerd: monospace font the tooltip pins by default (tooltip_font)')
provides=('tickerbar')
conflicts=('tickerbar')
options=(!debug)
source=("tickerbar-${pkgver}::https://github.com/mryll/tickerbar/releases/download/v${pkgver}/tickerbar-${pkgver}-x86_64-linux"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/mryll/tickerbar/v${pkgver}/LICENSE")
sha256sums=('a4ed7893a486ce51fdef6e904f23d18ed7bc19b5075a07d9f7ddddf45decb107'
            'aa9f3a694508cadff239e4694992eac66611723af6ce8643e80ca5c7db8c9e4e')

package() {
    install -Dm755 "tickerbar-${pkgver}" "$pkgdir/usr/bin/tickerbar"
    install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
