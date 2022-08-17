# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_appname='pdfScale'
_pkgname="${_appname,,}"
pkgname="${_pkgname}-git"
pkgver='r190.2c5657d'
pkgrel=1
pkgdesc='Bash Script to Scale and Resize PDFs using Ghostscript'
arch=('any')
url="https://github.com/tavinus/${_appname}"
license=('GPL')
conflicts=("${_pkgname}")
source=("git+https://github.com/tavinus/${_appname}.git")
sha256sums=('SKIP')

pkgver() {

	cd "${_appname}"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

package() {

	cd "${srcdir}/${_appname}"

	install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}"\
		"${pkgdir}/usr/bin"

	make IDIR="${pkgdir}/usr/bin" install
	install -Dm644 "${srcdir}/${_appname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

}
