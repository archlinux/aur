# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-git-lib
_pkgname=guile-git
pkgver=0.5.1
pkgrel=1
pkgdesc='Guile bindings for libgit2'
arch=('x86_64' 'i686' 'armv7h')
url="https://gitlab.com/guile-git/guile-git"
license=('GPL3')
depends=('guile' 'guile-bytestructures' 'libgit2>=0.28.0')
makedepends=('git')
source=(
	"${pkgname}-${pkgver}.tar.gz::https://gitlab.com/${_pkgname}/${_pkgname}/uploads/4ffd7377b0b74da4051356121b46116f/${_pkgname}-${pkgver}.tar.gz")
sha256sums=(
	'65e03731d56683f447b4c7fd0bfbf3467adad11218d5f9789d1ab859bf8e368c')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

check() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
