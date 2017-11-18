# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>
_pkgname=xmrig
pkgname=${_pkgname}-bin
pkgver=2.4.2
pkgrel=1
pkgdesc="Monero cryptocurrency CPU miner, HTTP API disabled"
arch=('x86_64')
url="https://github.com/xmrig/xmrig"
license=('GPL')
depends=('glibc')
optdepends=('monero: wallet')
install=${_pkgname}.install
changelog=CHANGELOG.md
source=("https://github.com/xmrig/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-gcc7-xenial-amd64-no-api.tar.gz"
        "https://raw.githubusercontent.com/xmrig/xmrig/master/README.md"
        "https://raw.githubusercontent.com/xmrig/xmrig/master/CHANGELOG.md")
md5sums=('06c1cd4b1cb85572a232399e2d8c1d7f'
         '22c511a8f70ba18dd2c6c1b5d244852d'
         'ed52b3b5215d06fffb82c352f6d66d9f')

package() {
	cd "${_pkgname}-$pkgver"

    install -Dm755 xmrig "${pkgdir}/usr/bin/xmrig"
    install -Dm644 config.json "${pkgdir}/usr/share/doc/xmrig/config.json.example"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/xmrig/README.md"
    install -Dm644 "${srcdir}/CHANGELOG.md" "${pkgdir}/usr/share/doc/xmrig/CHANGELOG.md"
}
