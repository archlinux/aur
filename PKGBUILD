# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
_pkgname=xmrig
pkgname=${_pkgname}-bin
pkgver=6.15.3
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
sha256sums=('5d1b2cf2db880c3e4c0e6f0c4a5cb336c3a50371b33297a4a4ce9674e04aa457'
            '440289d5e37326d669aa61743dac7b73ad1d65cd49cfde985902c23399cdf606')

package() {
	cd "${_pkgname}-$pkgver"

    install -Dm755 xmrig "${pkgdir}/usr/bin/xmrig"
    install -Dm644 config.json "${pkgdir}/usr/share/doc/xmrig/config.json.example"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/xmrig/README.md"
}
