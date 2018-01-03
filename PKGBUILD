pkgbase=('python-gdbgui')
pkgname=('python-gdbgui')
_module='gdbgui'
pkgver='0.9.3.0'
pkgrel=4
pkgdesc="Browser-based frontend to gdb (gnu debugger). Add breakpoints, view the stack, visualize data structures, and more in C, C++, Go, Rust, and Fortran. Run gdbgui from the terminal and a new tab will open in your browser."
url="https://github.com/cs01/gdbgui"
depends=('python' 'python' 'python-flask' 'python-pygdbmi' 'python-enum-compat' 'python-pypugjs' 'python-flask-socketio' 'python-gevent' 'python-eventlet' 'python-pygments' 'python-flask-compress')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("${pkgname}-${pkgver}.zip::https://github.com/cs01/gdbgui/archive/${pkgver}.zip")
md5sums=('2fbfb014495ca9f6979be2862ff1dd07')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python-gdbgui/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
