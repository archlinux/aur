pkgbase=('python-gdbgui')
pkgname=('python-gdbgui')
_module='gdbgui'
pkgver='0.9.1.0'
pkgrel=1
pkgdesc="browser-based gdb frontend using Flask and JavaScript to visually debug C, C++, Go, or Rust"
url="https://github.com/cs01/gdbgui"
depends=('python' 'python' 'python-flask-git' 'python-pygdbmi' 'python-enum-compat' 'python-pypugjs' 'python-flask-socketio' 'python-gevent' 'python-eventlet' 'python-pygments' 'python-flask-compress')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://codeload.github.com/cs01/gdbgui/tar.gz/${pkgver}")
md5sums=('8f71929c29a40bbb95d254b1b6aca015')

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
