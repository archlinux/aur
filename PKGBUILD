# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>
_pkgname=xmrig
pkgname=${_pkgname}-bin
pkgver=2.4.1
pkgrel=2
pkgdesc="Monero cryptocurrency CPU miner, HTTP API disabled"
arch=('x86_64')
url="https://github.com/xmrig/xmrig"
license=('GPL')
depends=('glibc')
optdepends=('monero: wallet')
install=${_pkgname}.install
changelog=CHANGELOG.md
source=("https://github.com/xmrig/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-gcc7-xenial-amd64-no-api.tar.gz"
        "README.md"
        "CHANGELOG.md")
md5sums=('58c09121338582a98be512ffb9850770'
         '3771cdb53fb322e5ad3600986846a416'
         '64c97681ae9b13b951ea8a577e5fca18')

package() {
	cd "${_pkgname}-$pkgver"

    install -Dm755 xmrig "${pkgdir}/usr/bin/xmrig"
    install -Dm644 config.json "${pkgdir}/usr/share/doc/xmrig/config.json.example"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/docs/xmrig/README.md"
    install -Dm644 "${srcdir}/CHANGELOG.md" "${pkgdir}/usr/share/docs/xmrig/CHANGELOG.md"
}
