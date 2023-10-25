# Maintainer: Vinay S Shastry <vinayshastry at gmail dot com>

pkgname=flarectl-bin
_pkgname="${pkgname%-bin}"
pkgver=0.80.0
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
b2sums=('db114cbbcc760df0b77f6bb7e253afe08d00db9a160e1ffed48e9a2ba0014df5375863f8d81d707ab3de4a355a4693b6fb5c03eb3244b25ac79e87edf8bcd260')

package() {
	install -D --mode 755 "${_pkgname}" --target-directory "${pkgdir}/usr/bin"
	install -D --mode 644 LICENSE --target-directory "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -D --mode 644 README.md --target-directory "${pkgdir}/usr/share/doc/${_pkgname}"
}
