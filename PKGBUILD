# Maintainer: Vinay S Shastry <vinayshastry at gmail dot com>

pkgname=flarectl-bin
_pkgname="${pkgname%-bin}"
pkgver=0.106.0
pkgrel=1
pkgdesc='CLI application for interacting with a Cloudflare account'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url='https://github.com/cloudflare/cloudflare-go/releases'
license=('BSD')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${url}/download/v${pkgver}/${_pkgname}_${pkgver}_${_goos}_${_goarch}.tar.gz")
b2sums=('e34d793668cfb9c97018343fb9ce7e4699ef54c5ff66213f943c25effad8e59c0113e386d43eadee9b8ebb0bb8d6c3583eb08e67abd6da8ff293158fea53ecd5')

package() {
	install -D --mode 755 "${_pkgname}" --target-directory "${pkgdir}/usr/bin"
	install -D --mode 644 LICENSE --target-directory "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -D --mode 644 README.md --target-directory "${pkgdir}/usr/share/doc/${_pkgname}"
}
