# Maintainer: mryll <https://github.com/mryll>
pkgname=tickerbar-bin
pkgver=0.6.1
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
        "config.example.toml-${pkgver}::https://raw.githubusercontent.com/mryll/tickerbar/v${pkgver}/config.example.toml"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/mryll/tickerbar/v${pkgver}/LICENSE")
sha256sums=('be040c8958f5372dd35fdcd4d1cc05641f7f1fde17ffa55244c1dd7c89fc421c'
            'fbe87470a44c8d20a3111ba011ea718215a26297dc77e0090f5f23774bbcb75f'
            'aa9f3a694508cadff239e4694992eac66611723af6ce8643e80ca5c7db8c9e4e')

package() {
    install -Dm755 "tickerbar-${pkgver}" "$pkgdir/usr/bin/tickerbar"
    install -Dm644 "config.example.toml-${pkgver}" "$pkgdir/usr/share/tickerbar/config.example.toml"
    install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
