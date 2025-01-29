# Maintainer: Vinay S Shastry <vinayshastry at gmail dot com>

pkgname=flarectl-bin
_pkgname="${pkgname%-bin}"
pkgver=0.115.0
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
b2sums=('138d77c259e3d90cc91020fe0cd5ea33b87add36d9f8015135d01394e40561d28f97137ab37552dd3d05414bd94b80ff09dde5401e03109a7da25a02e88f70d1')

package() {
	install -D --mode 755 "${_pkgname}" --target-directory "${pkgdir}/usr/bin"
	install -D --mode 644 LICENSE --target-directory "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -D --mode 644 README.md --target-directory "${pkgdir}/usr/share/doc/${_pkgname}"
}
