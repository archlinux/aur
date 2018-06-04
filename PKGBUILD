# Maintainer: Pieter Lenaerts <pieter dot aj dot lenaerts gmail>

pkgname=imgdupes-git
_pkgname=imgdupes
pkgver=1.2.r13.gb424e4a
pkgrel=1
provides=('imgdupes')
conflicts=('imgdupes')
pkgdesc='Checks for duplicated images in a directory tree, ignoring metadata'
arch=('any')
url='https://github.com/jesjimher/imgdupes'
depends=('libgexiv2' 'python2-texttable' 'python2-jpegtran-cffi' 'python2-pillow' 'python2-gobject')
makedepends=('git')
license=('GPL3')
source=("git+https://github.com/jesjimher/imgdupes.git")
sha512sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	install -Dm755 "${srcdir}/imgdupes/imgdupes.py" "${pkgdir}/usr/bin/imgdupes"
	install -Dm644 "${srcdir}/imgdupes/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
