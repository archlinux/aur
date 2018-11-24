# Maintainer: ZWindL <zwindl@protonmail.com>
pkgbase=python-gdbgui
pkgname=python-gdbgui
_module='gdbgui'
pkgver=0.13.1.1
pkgrel=1
pkgdesc="browser-based gdb frontend using Flask and JavaScript to visually debug C, C++, Go, or Rust"
url="https://github.com/cs01/gdbgui"
depends=('python' 'python-flask12' 'python-flask-compress' 'python-flask-socketio2' 'python-gevent' 'python-pygdbmi' 'python-pygments')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cs01/gdbgui/archive/${pkgver}.tar.gz")
md5sums=('2317ff64311fdb1d7604a5c313c3fe01')

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
