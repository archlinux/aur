# Maintainer: Tharre <tharre3@gmail.com>

pkgname=python-enlighten
_name=enlighten
pkgver=1.5.1
pkgrel=1
pkgdesc='A console progress bar module for Python'
url='https://github.com/Rockhopper-Technologies/enlighten'
arch=('any')
license=('MPL2')
depends=('python-blessed')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('836b92850aa1fa1ff9de45d7736f77ed253210928fe423898e5994cb51b755ee')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
