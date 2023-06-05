pkgname=audela-svn
_pkgname=audela
pkgver=3.0.0
pkgrel=1
pkgdesc="AudeLA is a TCL extension aimed at providing amateur astronomers with image processing, telescope controling, ccd camera driving, and various astronomical algorithms"
arch=(x86_64)
url="https://sourceforge.net/projects/audela/"
license=(GPL)
depends=()
makedepends=('subversion' 'libjpeg6-turbo')
source=("svn+https://svn.code.sf.net/p/${_pkgname}/code/trunk/${_pkgname}")
sha256sums=('SKIP')


build() {
	cd "${srcdir}/${_pkgname}/src/"
	./configure --prefix=/usr
	make all
}

package() {
	cd "${srcdir}/${_pkgname}/src/audela"
	make DESTDIR="${pkgdir}" install
}

