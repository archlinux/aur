# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=fcsonline
_pkgname=drill
pkgname=${_pkgname}-bin
pkgver=0.8.3
pkgrel=1
pkgdesc="HTTP load testing application written in Rust inspired by Ansible syntax"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
license=('GPL-3.0')

depends=('openssl-1.1')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "SYNTAX-${pkgver}.md::${_urlraw}/SYNTAX.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_${arch[0]}-unknown-linux-musl.tar.gz")
sha256sums=('589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2'
            '37c6c933ed70b40433aafa65784554ed9667d48ed109c72a495e6867819235db'
            '5caca31570cd6afc8c21313d135ccd6acaae9ab1d73256c93fbc532c472685ce')
sha256sums_x86_64=('22be45c56778fe994cba8cc43feec8394a0649c63b23519ed7c70097e6bf41b1')



package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "SYNTAX-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SYNTAX.md"
}
