# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>
_pkgname=xmrig
pkgname=${_pkgname}-bin
pkgver=5.2.1
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
changelog=CHANGELOG.md
source=("https://github.com/xmrig/xmrig/releases/download/v${pkgver}/${_pkgname}-${pkgver}-xenial-x64.tar.gz"
        "https://raw.githubusercontent.com/xmrig/xmrig/v${pkgver}/README.md")
sha256sums=('b8ffbeb544fc00b93e47f280a972075f3b9215d9d76cda5a13ae3e0f38fb1b25'
            'be2e2d2d12dc08494d71540284dcca1f04d5e11533bbcba4c9326c3bdbae9c6d')

package() {
	cd "${_pkgname}-$pkgver"

    install -Dm755 xmrig "${pkgdir}/usr/bin/xmrig"
    install -Dm755 xmrig-notls "${pkgdir}/usr/bin/xmrig-notls"
    install -Dm644 config.json "${pkgdir}/usr/share/doc/xmrig/config.json.example"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/xmrig/README.md"
}
