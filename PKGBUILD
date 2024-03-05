# Maintainer: MatMoul <matmoul at the google email domain which is .com>

_githubuser=aarnt
_githubrepo=octopi
_gitcommit=64e72f06c9ae9c844b92977e036865d90339b87d

pkgname=octopi-notifier-qt5-dev
pkgver=0.16.0.r4.64e72f0
pkgrel=1
pkgdesc='Notifier for Octopi using Qt5 libs'
arch=('any')
url="https://github.com/${_githubuser}/${_githubrepo}"
arch=('any')
url="https://github.com/${_githubuser}/${_githubrepo}"
license=('GPL2')
depends=('octopi-dev')
makedepends=('git' 'qt5-tools')
provides=('octopi-notifier')
source=("git+https://github.com/${_githubuser}/${_githubrepo}.git#commit=${_gitcommit}")
sha256sums=('SKIP')

build() {
	cd "${_githubrepo}"
	msg "Building octopi-notifier..."
	cd notifier
	qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" octopi-notifier.pro
	make
}

package() {
	cd "${_githubrepo}"
	cd notifier
	make INSTALL_ROOT="${pkgdir}" install
}
