# Maintainer: Tharre <tharre3@gmail.com>

pkgname=python-enlighten
_name=enlighten
pkgver=1.3.0
pkgrel=1
pkgdesc='A console progress bar module for Python'
url='https://github.com/Rockhopper-Technologies/enlighten'
arch=('any')
license=('MPL2')
depends=('python-blessed')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('a462bc502ae7479b43d89b9fa0aedbd9762de69539d6fa58516ce8b970c2843d')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
