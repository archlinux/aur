# Maintainer: Tharre <tharre3@gmail.com>

pkgname=python-enlighten
_name=enlighten
pkgver=1.4.0
pkgrel=1
pkgdesc='A console progress bar module for Python'
url='https://github.com/Rockhopper-Technologies/enlighten'
arch=('any')
license=('MPL2')
depends=('python-blessed')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('93b859b5ee2f2494715bc32a1890b0a82de80a6afd536909e5663772ab2c792e')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
