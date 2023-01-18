# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=flarectl-bin
_pkgname="${pkgname%-bin}"
pkgver=0.59.0
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
b2sums=('3dd46ac231bf16f581768224019973d0d331f61e15c92ce936d9d2c594ba4076cd13ee85e7b4ffffc8cd6ce6de206d2f06b6a1bbb09f39989e425d9513488a40')

package() {
	install -D --mode 755 "${_pkgname}" --target-directory "${pkgdir}/usr/bin"
	install -D --mode 644 LICENSE --target-directory "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -D --mode 644 README.md --target-directory "${pkgdir}/usr/share/doc/${_pkgname}"
}
