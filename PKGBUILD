# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>
_pkgname=xmrig
pkgname=${_pkgname}-bin
pkgver=2.12.0
pkgrel=1
pkgdesc="Monero cryptocurrency CPU miner, HTTP API enabled, with default donation level"
arch=('x86_64')
url="https://github.com/xmrig/xmrig"
license=('GPL')
depends=('glibc')
optdepends=('monero: wallet')
install=${_pkgname}.install
changelog=CHANGELOG.md
source=("https://github.com/xmrig/xmrig/releases/download/v${pkgver}/${_pkgname}-${pkgver}-xenial-x64.tar.gz"
        "https://raw.githubusercontent.com/xmrig/xmrig/v${pkgver}/README.md")
md5sums=('2087c4002eed30ebf0f79c091879a86c'
         '4f18b339fa6ce249539e412574ea9f65')

package() {
	cd "${_pkgname}-$pkgver"

    install -Dm755 xmrig "${pkgdir}/usr/bin/xmrig"
    install -Dm755 xmrig-notls "${pkgdir}/usr/bin/xmrig-notls"
    install -Dm644 config.json "${pkgdir}/usr/share/doc/xmrig/config.json.example"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/xmrig/README.md"
}
