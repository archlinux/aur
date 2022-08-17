# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=flarectl-bin
_pkgname="${pkgname%-bin}"
pkgver=0.47.0
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
b2sums=('fc9bd354e834d793a39c920824526b0b7a88b82cfb00896bd5645c7037b2d7c79d515c1c88f9633eed1947ca226f93cce91fdcd1c7bcb27ab1bd50819c28dcbb')

package() {
	install -D --mode 755 "${_pkgname}" --target-directory "${pkgdir}/usr/bin"
	install -D --mode 644 LICENSE --target-directory "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -D --mode 644 README.md --target-directory "${pkgdir}/usr/share/doc/${_pkgname}"
}
