# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=erg-lang
_pkgname=erg
pkgname=${_pkgname}-bin
pkgver=0.6.50
pkgrel=1
pkgdesc='Statically typed language that builds upon the Python ecosystem'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT' 'Apache')
depends=('python')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-MIT-${pkgver}::${_urlraw}/LICENSE-MIT"
		"LICENSE-APACHE-${pkgver}::${_urlraw}/LICENSE-APACHE")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[1]}-unknown-linux-gnu.tar.gz")
sha256sums=('c5318119bfa1324d858d75bba3284d2ce39a2f750cd66f01cefcfe37391b8b31'
            '508a77d2e7b51d98adeed32648ad124b7b30241a8e70b2e72c99f92d8e5874d1'
            '3905892d35c90001cd11101d367d4073b773f30fa7ce868748969f4cc1fb24c2')
sha256sums_x86_64=('07633cbc4c98f59a6db9036994d0d09fbe2ebd3f329d4ec437a071fd47a53a17')
sha256sums_aarch64=('9dfc46cbc14c5a79f81d32f79d50e3b7c974e4e2a5e2859744378bfb1fd8e651')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
