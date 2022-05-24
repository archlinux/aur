# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=flarectl-bin
_pkgname="${pkgname%-bin}"
pkgver=0.39.0
pkgrel=1
pkgdesc='CLI application for interacting with a Cloudflare account'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url='https://github.com/cloudflare/cloudflare-go/releases'
license=('BSD')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${url}/download/v${pkgver}/${_pkgname}_${pkgver}_${_goos}_${_goarch}.tar.xz")
b2sums=('373f541363db2f3999c3f4c74bee7166a3badf4f781010d3230e0ad9dcc40684f650f9c9bb709b3f1c5d81b533823433a3cffadc5630e0ffb5cbb08054e8ff30')

package() {
	install -D --mode 755 "${_pkgname}" --target-directory "${pkgdir}/usr/bin"
	install -D --mode 644 LICENSE --target-directory "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -D --mode 644 README.md --target-directory "${pkgdir}/usr/share/doc/${_pkgname}"
}
