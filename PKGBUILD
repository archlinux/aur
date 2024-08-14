# Maintainer: Vinay S Shastry <vinayshastry at gmail dot com>

pkgname=flarectl-bin
_pkgname="${pkgname%-bin}"
pkgver=0.102.0
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
b2sums=('378873ecaebe24f3375fb5498c8edbd448122f7b8572124d7ff121176621a415f2d7f951323bf761707d6c4ac4b236544cc37cb23c23f92dfb4f6422a9b0769c')

package() {
	install -D --mode 755 "${_pkgname}" --target-directory "${pkgdir}/usr/bin"
	install -D --mode 644 LICENSE --target-directory "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -D --mode 644 README.md --target-directory "${pkgdir}/usr/share/doc/${_pkgname}"
}
