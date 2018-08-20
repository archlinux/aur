# Maintainer: Pieter Lenaerts <pieter dot aj dot lenaerts gmail>

pkgname=jpegdupes-git
_orig_pkg_dir=imgdupes
pkgver=1.2.r25.g75eb5d7
pkgrel=1
provides=('jpegdupes')
conflicts=('jpegdupes' 'imgdupes' 'imgdupes-git')
pkgdesc='Checks for duplicated images in a directory tree, ignoring metadata'
arch=('any')
url='https://github.com/jesjimher/imgdupes'
depends=('libgexiv2' 'python-texttable' 'python-jpegtran-cffi' 'python-pillow' 'python-gobject')
makedepends=('git')
license=('GPL3')
source=("git+https://github.com/jesjimher/imgdupes.git")
sha512sums=('SKIP')

pkgver() {
	cd "$_orig_pkg_dir"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	install -Dm755 "${srcdir}/${_orig_pkg_dir}/jpegdupes/jpegdupes.py" "${pkgdir}/usr/bin/jpegdupes"
	install -Dm644 "${srcdir}/${_orig_pkg_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
