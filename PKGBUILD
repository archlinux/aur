# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>

pkgname=qdirstat-git
_pkgname=qdirstat
pkgver=20220105.96ba7b6
pkgrel=2
pkgdesc="GUI disk usage utility (successor to kdirstat)"
arch=('i686' 'x86_64')
url="https://github.com/shundhammer/qdirstat"
license=('GPL2')
depends=('qt5-base')
makedepends=('git')
provides=('qdirstat')
conflicts=('qdirstat' 'qdirstat-bin')
source=("git+https://github.com/shundhammer/qdirstat.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build () {
	cd "$srcdir/${_pkgname}"
	qmake-qt5
	make
}

package () {
        cd "$srcdir/${_pkgname}"
	make INSTALL_ROOT="${pkgdir}" install
}
