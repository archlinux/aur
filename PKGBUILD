pkgname=indiprop-git
_gitname=indiprop
pkgver=20160818
pkgrel=2
pkgdesc="provides a generic user interface for browsing device properties published by an INDI compliant server"
url="https://code.google.com/p/indiprop/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt4')
#optdepends=('')
makedepends=('make' 'gcc' 'git')
source=('git+https://github.com/aaronevers/indiprop')
sha1sums=('SKIP')

pkgver() {
#	cd "${srcdir}/${pkgname}"
#	git rev-list --count master
	date +%Y%m%d
}

build() {
	cd $_gitname
	qmake-qt4
	make
}

package() {
	cd $_gitname
	make INSTALL_ROOT="${pkgdir}/usr" install
}

