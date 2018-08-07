# Maintainer: Renato Coutinho <renato.coutinho@gmail.com>
pkgbase=python-pydde-git
pkgname=('python-pydde-git' 'python2-pydde-git')
pkgver=0.2.2.r13.g602c0aa
pkgrel=1
pkgdesc="A solver for delay differential equations written in Python and C."
arch=('i686' 'x86_64')
url='https://github.com/hensing/PyDDE'
license=('GPL')
makedepends=('python-setuptools')
source=("git+https://github.com/hensing/PyDDE.git")
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/PyDDE
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package_python-pydde-git() {
    depends=('python-numpy')
    provides=('python-pydde')
    cd ${srcdir}/PyDDE
    python2 setup.py install --prefix=/usr --root=${pkgdir}
}

package_python2-pydde-git() {
    depends=('python2-numpy')
    provides=('python2-pydde')
    cd ${srcdir}/PyDDE
    python3 setup.py install --prefix=/usr --root=${pkgdir}
}
