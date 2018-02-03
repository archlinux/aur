pkgbase=('python-gdbgui')
pkgname=('python-gdbgui')
_module='gdbgui'
pkgver='0.11.0.0'
pkgrel=1
pkgdesc="browser-based gdb frontend using Flask and JavaScript to visually debug C, C++, Go, or Rust"
url="https://github.com/cs01/gdbgui"
depends=('python' 'python' 'python-flask' 'python-flask-compress' 'python-flask-socketio' 'python-gevent' 'python-pygdbmi' 'python-pygments')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/g/gdbgui/gdbgui-${pkgver}.tar.gz")
md5sums=('96b7f93c09b7156d4ff98ef398de1e53')

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
