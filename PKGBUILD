# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=vaibhav-mattoo
_pkgname=alman
pkgname=${_pkgname}-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Intelligent alias manager with TUI for managing shell aliases with intelligent suggestions based on command history"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[1]}-unknown-linux-musl.tar.gz")
sha256sums=('5c4f66133a924db1fcc7218088f8c73c87b382bcb9612fc9347f4c0b83658cce'
            '50938bef4dcde911f2ef821b223aba7d8d25b71978c8ca4b6f73c16f34659f2b')
sha256sums_x86_64=('02e6122635dffa5c00d44e2086e584ec859b8f2b0bd0608ceeeaaaf92a366d10')
sha256sums_aarch64=('864dd03f1b56d6c8055a6e26366489127fa1c94d90a6e871d9bd09ad657cf590')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
