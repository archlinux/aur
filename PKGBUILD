# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
_pkgname=xmrig
pkgname=${_pkgname}-bin
pkgver=6.20.0
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
sha256sums=('99e3e313b62bb8b55e2637fc14a78adb6f33632a3c722486416252e2630cfdf6'
            'ef2f3e38bf1a8fd31e5427c49122c059a8d22d2087e8571360c3bbeeba4ced90')

package() {
	cd "${_pkgname}-$pkgver"

    install -Dm755 xmrig "${pkgdir}/usr/bin/xmrig"
    install -Dm644 config.json "${pkgdir}/usr/share/doc/xmrig/config.json.example"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/xmrig/README.md"
}
