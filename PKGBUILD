# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>
_pkgname=xmrig
pkgname=${_pkgname}-bin
pkgver=2.4.3
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
md5sums=('0e42b88f34239d7f43456a8216c7c93f'
         '22c511a8f70ba18dd2c6c1b5d244852d'
         'a2e21276b5039986153134d8794df510')

package() {
	cd "${_pkgname}-$pkgver"

    install -Dm755 xmrig "${pkgdir}/usr/bin/xmrig"
    install -Dm644 config.json "${pkgdir}/usr/share/doc/xmrig/config.json.example"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/xmrig/README.md"
    install -Dm644 "${srcdir}/CHANGELOG.md" "${pkgdir}/usr/share/doc/xmrig/CHANGELOG.md"
}
