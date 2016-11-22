# Maintainer: Michael Schubert <mschu.dev at google mail>
# Contributor: Ewoud Nuyts <ewoud.nuyts@gmail.com>

pkgname=jessyink
pkgver=1.5.6
pkgrel=1
pkgdesc="JavaScript that turns a layered Inkscape SVG image into a presentation"
url="http://code.google.com/p/jessyink/"
license=("GPL")
arch=('i686' 'x86_64')
depends=('inkscape' 'python-lxml')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7a69059cb130d2eccf06857b5ab8b17de4a62948a977fafb0fe0ebc726e43be4')
# path within the archive starts with ${pkgname}-${pkgver}.tar.gz
# so do not extract, but handle this manually
noextract=("${pkgname}-${pkgver}.tar.gz")

package() {
	cd "${srcdir}/"

	bsdtar -s '/.tar.gz//' -xf "${pkgname}-${pkgver}.tar.gz"

	cd "${pkgname}-${pkgver}/"

	install -d "${pkgdir}"/usr/share/inkscape/extensions/
	install -m0644 $(find inkscapeExtensions/ -type f) "${pkgdir}"/usr/share/inkscape/extensions/
}

