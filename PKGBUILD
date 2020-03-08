# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>
_pkgname=xmrig
pkgname=${_pkgname}-bin
pkgver=5.9.0
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
sha256sums=('1727449ec2da2ff7c52651d67e188f6bf1d6803a22890de3a539a324df960b68'
            'e77d1647221119828bf38891761f57e20a74500a8822b8d9d8333dd8ac97bbf0')

package() {
	cd "${_pkgname}-$pkgver"

    install -Dm755 xmrig "${pkgdir}/usr/bin/xmrig"
    install -Dm755 xmrig-notls "${pkgdir}/usr/bin/xmrig-notls"
    install -Dm644 config.json "${pkgdir}/usr/share/doc/xmrig/config.json.example"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/xmrig/README.md"
}
