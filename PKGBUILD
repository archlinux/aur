# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=erg-lang
_pkgname=erg
pkgname=${_pkgname}-bin
pkgver=0.6.53
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
sha256sums_x86_64=('671034889030a68c3557123c3ab51197d820499124e411c301b17d2d32876dfa')
sha256sums_aarch64=('d5e8b7525c92c43717bcba18584c508a95a63795941c84e1edadde00a970f642')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
