# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-deltachat
_module='deltachat'
pkgver=1.97.0
pkgrel=1
pkgdesc="Python bindings for the Delta Chat Core library using CFFI against the Rust-implemented libdeltachat"
url="https://pypi.org/project/deltachat/"
depends=(libdeltachat python-cffi python-imap-tools python-pluggy python-idna)
makedepends=(python-setuptools python-pkgconfig)
license=('MPL')
arch=('x86_64')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('1f3410029ae70abc40745a4b4db6acaf804e4165d718b3e2756bf43efe9eba10')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
