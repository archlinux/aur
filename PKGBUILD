pkgname=python-pz
_module='pz'
pkgver=1.0.0
pkgrel=1
pkgdesc="Utility to substitute awk, sed and/or grep with Python"
url="https://github.com/CZ-NIC/pz"
depends=('python')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('5142614f9d0ca1afd68efc57bf65218aaa52d093999de647f7268034ce8e2e95')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
