# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=flarectl-bin
_pkgname="${pkgname%-bin}"
pkgver=0.51.0
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
b2sums=('875b07280a838f01b36e13aab7393930da0b4a5a1d6ccdb77d82d9a29cf0a6fd69746e0aafe90e60a92f3ec74c33fb79e95c58833b885e7a692d14b367fa79e2')

package() {
	install -D --mode 755 "${_pkgname}" --target-directory "${pkgdir}/usr/bin"
	install -D --mode 644 LICENSE --target-directory "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -D --mode 644 README.md --target-directory "${pkgdir}/usr/share/doc/${_pkgname}"
}
