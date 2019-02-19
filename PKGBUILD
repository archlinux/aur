# Maintainer: Tharre <tharre3@gmail.com>

pkgname=python-enlighten
_name=enlighten
pkgver=1.1.0
pkgrel=1
pkgdesc='A console progress bar module for Python'
url='https://github.com/Rockhopper-Technologies/enlighten'
arch=('any')
license=('MPL2')
depends=('python-blessed')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('b06ae600ed4afc834cea21ae22e3400e2c46f41ef71b9d0a530602aacf846a4d')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
