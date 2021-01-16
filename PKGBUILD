# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
_pkgname=xmrig
pkgname=${_pkgname}-bin
pkgver=6.7.2
pkgrel=1
pkgdesc="Monero cryptocurrency CPU miner, HTTP API enabled, with default donation level"
arch=('x86_64')
url="https://github.com/xmrig/xmrig"
license=('GPL')
depends=('glibc')
optdepends=('monero: wallet'
            'xmrig-cuda: CUDA plugin to mine on NVidia GPU')
provides=('xmrig')
conflicts=('xmrig')
replaces=('xmrig')
install=${_pkgname}.install
source=("https://github.com/xmrig/xmrig/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.tar.gz"
        "https://raw.githubusercontent.com/xmrig/xmrig/v${pkgver}/README.md")
sha256sums=('b090e190c0d1ccc0ee8eb3160c2f817d879a8f8e2157dfcaa5703fc851460cec'
            '20034f3c3af502fc1671f1540dfc9b989f971c9297ff090958db1d513186a22a')

package() {
	cd "${_pkgname}-$pkgver"

    install -Dm755 xmrig "${pkgdir}/usr/bin/xmrig"
    install -Dm644 config.json "${pkgdir}/usr/share/doc/xmrig/config.json.example"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/xmrig/README.md"
}
