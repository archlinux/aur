# Contributor: Renato Coutinho <renato.coutinho@gmail.com>
pkgname=python2-pydde-git
pkgver=0.2.2.r13.g602c0aa
pkgrel=1
pkgdesc="A solver for delay differential equations written in Python and C."
arch=('i686' 'x86_64')
url="https://github.com/hensing/PyDDE"
license=('GPL')
depends=('python2-numpy')
makedepends=('python2-setuptools' 'python2-numpy')
conflicts=('python2-pydde')
provides=('python2-pydde')
source=("git+https://github.com/hensing/PyDDE.git")
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/PyDDE
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/PyDDE
    python2 setup.py install --prefix=/usr --root=${pkgdir}
}

