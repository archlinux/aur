# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_appname='pdfScale'
pkgname="${_appname,,}"
pkgver='2.5.3'
pkgrel=1
pkgdesc='Bash Script to Scale and Resize PDFs using Ghostscript'
arch=('any')
url="https://github.com/tavinus/${_appname}"
license=('GPL')
conflicts=("${pkgname}-git")
source=("https://github.com/tavinus/${_appname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7e37316d39111c05d65c11837f72ad53885e6da3cced69b3e7cebd70ab1e4bb9')

package() {

	cd "${srcdir}/${_appname}-${pkgver}"

	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"\
		"${pkgdir}/usr/bin"

	make IDIR="${pkgdir}/usr/bin" install
	install -Dm644 "${srcdir}/${_appname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

}

