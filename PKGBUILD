# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=yj-bin
_pkgname="${pkgname%-bin}"
pkgver=5.1.0
pkgrel=3
pkgdesc='CLI to convert between YAML, TOML, JSON, and HCL'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url="https://github.com/sclevine/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/sclevine/${_pkgname}"
license=('Apache')
provides=("${_pkgname}")
conflicts=(
	"${_pkgname}"
	"${_pkgname}-git"
)
source=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-${_goos}-${_goarch}"
		"LICENSE-${pkgver}::${_urlraw}/v${pkgver}/LICENSE"
		"README-${pkgver}::${_urlraw}/v${pkgver}/README.md")
b2sums=('efa71a2534846069478818d90266e350ae65021bb24661fcc6459cc60a0d81fdd0fe58ac3bf336ba799a6ae73d11405202c066ea54fcdfbb5d106d695bb41adf'
        'b7bd72981601b17b44b63e77c422e02a0d0bc0f4c903e700f402b9f07a06f0b91a4045896d0cebb0e31694c75a98fdd2ed4c2fd5c876bdf568099a9a9f973988'
        'cf87276ad5ff91c9977d81543680fa801ef72a2e20d2846b5935cc16928a757c84f14345600660e6b82b25798feac39226d3772c2d6363393ea971e1be597ea9')

package() {
	install -Dm755 "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/README-${pkgver}" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
