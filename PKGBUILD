# Maintainer: Firegem
# shellcheck disable=SC2034,2154,2164
_pkgname=nimlangserver
pkgname="${_pkgname}-bin"
pkgver=1.12.0
pkgrel=1
pkgdesc='The Nim language server'
arch=('x86_64')
url='https://github.com/nim-lang/langserver'
depends=('glibc')
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname"{,-git})
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.tar.gz"
    'LICENSE.txt::https://raw.githubusercontent.com/nim-lang/Nim/refs/heads/devel/copying.txt'
)
sha256sums=('af541e3177257abe9e0631fb4b1d2509cf32508ce36dfae7b0011e5536be9ac7'
            'c8179122923594d5a54231b10b9fe2ca0861dcf2f0d0f525bae8be24db1893bd')

package() {
    install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim: et sw=4
