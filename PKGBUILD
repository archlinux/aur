# Maintainer: Firegem

_pkgname=nimlangserver
pkgname="${_pkgname}-bin"
pkgver=1.8.1
pkgrel=3
pkgdesc='The Nim language server'
arch=('x86_64')
url='https://github.com/nim-lang/langserver'
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname"{,-git})
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.tar.gz"
    'LICENSE.txt::https://raw.githubusercontent.com/nim-lang/Nim/refs/heads/devel/copying.txt'
)
sha256sums=('f7fdfbe1a15b092166285efe8b59563847fc98e46e8c8c846874552de453726e'
            'c8179122923594d5a54231b10b9fe2ca0861dcf2f0d0f525bae8be24db1893bd')

package() {
    depends=('glibc')
    install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
