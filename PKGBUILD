# Maintainer: zach <zach {at} zach-adams {dot} com>

pkgname=imgp-git
_pkgname=imgp
_pkgauthor=jarun
pkgver=141.ac30556
pkgrel=1
pkgdesc="Resize or rotate JPEG and PNG images."
arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('GPL3')
depends=('python3' 'python-pillow')
makedepends=('git')
source=(${_pkgname}::"git+https://github.com/${_pkgauthor}/${_pkgname}.git")
sha256sums=('SKIP')
conflicts=('imgp')
provides=('imgp')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
	make -C "${srcdir}/${_pkgname}" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
