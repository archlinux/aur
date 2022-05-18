# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-deltachat
_module='deltachat'
pkgver=1.79.0
pkgrel=1
pkgdesc="Python bindings for the Delta Chat Core library using CFFI against the Rust-implemented libdeltachat"
url="https://pypi.org/project/deltachat/"
depends=(libdeltachat python-cffi python-requests python-imap-tools python-pluggy python-idna python-urllib3 python-pycparser python-charset-normalizer python-certifi)
makedepends=(python-setuptools)
license=('MPL')
arch=('x86_64')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('0555209cbe6a619138f911cb9407a699da8782227370f9f370b8847833ed7de2')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
