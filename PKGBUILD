# Maintainer: MatMoul <matmoul at the google email domain which is .com>

_githubuser=aarnt
_githubrepo=qt-sudo
_gitcommit=90282654601767c69e564be81e8c33ab4e7c9095

pkgname=qt-sudo
pkgver=0.0.0.r1.9028265
pkgrel=1
pkgdesc='A clone of LXQt sudo tool, without LXQt libs '
arch=('any')
url="https://github.com/${_githubuser}/${_githubrepo}"
license=('LGPL2.1')
depends=('sudo')
makedepends=('git' 'qt5-tools')
source=("git+https://github.com/${_githubuser}/${_githubrepo}.git#commit=${_gitcommit}")
sha256sums=('SKIP')

build() {
	cd "${_githubrepo}"
	echo "Starting build..."
	qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}"
	make
}

package() {
	cd "${_githubrepo}"
	#make install_ROOT="${pkgdir}" install
	install -D -m755 qt-sudo "${pkgdir}"/usr/bin/qt-sudo
}
