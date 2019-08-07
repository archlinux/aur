# Maintainer: ZWindL <zwindl@protonmail.com>
pkgbase=python-gdbgui
pkgname=python-gdbgui
_module='gdbgui'
pkgver=0.13.2.0
pkgrel=1
pkgdesc="Browser-based frontend to gdb (gnu debugger). Add breakpoints, view the stack, visualize data structures, and more in C, C++, Go, Rust, and Fortran. Run gdbgui from the terminal and a new tab will open in your browser. https://gdbgui.com"
url="https://github.com/cs01/gdbgui"
depends=('python' 'python-flask12' 'python-flask-compress' 'python-flask-socketio2' 'python-gevent' 'python-pygdbmi' 'python-pygments')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cs01/gdbgui/archive/${pkgver}.tar.gz")
md5sums=('0e769e57691900f42ffaaaf8d91e285f')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    rm -rf tests
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
