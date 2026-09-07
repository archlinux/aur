# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# Maintainer: Vinay S Shastry <vinayshastry at gmail dot com>

pkgname=flarectl-bin
_pkgname="${pkgname%-bin}"
pkgver=0.118.0
pkgrel=1
pkgdesc='CLI application for interacting with a Cloudflare account'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url='https://github.com/cloudflare/cloudflare-go/releases'
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${url}/download/v${pkgver}/${_pkgname}_${pkgver}_${_goos}_${_goarch}.tar.gz")
b2sums=('bef5dddc21532f244d234d46008a1658f40e22a6c761d8fc3dc0a105983391c29094594bd5dabfb4cc1ed7b109bd34bd30c3e53a12f4e4012928e0f26dd973b1')

package() {
	install -D --mode 755 "${_pkgname}" --target-directory "${pkgdir}/usr/bin"
	install -D --mode 644 LICENSE --target-directory "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -D --mode 644 README.md --target-directory "${pkgdir}/usr/share/doc/${_pkgname}"
}
