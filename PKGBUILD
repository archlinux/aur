# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>
_pkgname=xmrig
pkgname=${_pkgname}-bin
pkgver=2.6.3
pkgrel=1
pkgdesc="Monero cryptocurrency CPU miner, HTTP API enabled, with default donation level"
arch=('x86_64')
url="https://github.com/xmrig/xmrig"
license=('GPL')
depends=('glibc')
optdepends=('monero: wallet')
install=${_pkgname}.install
changelog=CHANGELOG.md
source=("https://github.com/xmrig/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-xenial-amd64.tar.gz"
        "https://raw.githubusercontent.com/xmrig/xmrig/v${pkgver}/README.md")
md5sums=('dd36396e5fd96291315140cd658a56c0'
         '83a66c67b836e0c0b7f32f1960759735')

package() {
	cd "${_pkgname}-$pkgver"

    install -Dm755 xmrig "${pkgdir}/usr/bin/xmrig"
    install -Dm644 config.json "${pkgdir}/usr/share/doc/xmrig/config.json.example"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/xmrig/README.md"
}
