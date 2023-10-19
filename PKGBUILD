# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>
# Co-maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=qdirstat-git
_pkgname=qdirstat
epoch=1
pkgver=1.8.1.r42.g8174478
pkgrel=1
pkgdesc="GUI disk usage utility (successor to kdirstat)"
arch=('i686' 'x86_64')
url="https://github.com/shundhammer/qdirstat"
license=('GPL2')
depends=('qt5-base')
makedepends=('git')
provides=('qdirstat')
conflicts=('qdirstat')
source=("git+https://github.com/shundhammer/qdirstat.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
