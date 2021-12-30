# Maintainer: Ranadeep B < mail at rnbguy dot at >

_basename=sentinel
_pkgname=${_basename}-client-cli
pkgname=${_pkgname}-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="The official ${_basename} CLI client"
arch=('x86_64')
url="https://github.com/${_basename}-official/cli-client"
license=('Apache')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=(
	'openresolv'
	'wireguard-tools'
)
source=(
	"https://github.com/${_basename}-official/cli-client/releases/download/v${pkgver}/${_basename}cli-${pkgver}-linux-amd64"
	"https://raw.githubusercontent.com/${_basename}-official/cli-client/v${pkgver}/LICENSE"
)
sha256sums=(
	'd311313fea6db8ce78402b13970c0fdbf8c34e2c1e5937e4852938f9a4b3df12'
	'2da574d2e8ac213083963019ef9cc1a97a5ea93dafa6bbe1bf3c1fdfff0c16b3'
)

package() {
	install -DT "${srcdir}/${_basename}cli-${pkgver}-linux-amd64" "${pkgdir}/usr/local/bin/${_basename}cli"
	install -m644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
