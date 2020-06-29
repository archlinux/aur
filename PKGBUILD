# Maintainer: Tharre <tharre3@gmail.com>

pkgname=python-enlighten
_name=enlighten
pkgver=1.6.0
pkgrel=1
pkgdesc='A console progress bar module for Python'
url='https://github.com/Rockhopper-Technologies/enlighten'
arch=('any')
license=('MPL2')
depends=('python-blessed')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('1f69366a9cf0525ea58145c22e8312d0de855cd83416d65ba6d8f6220de0b436')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
