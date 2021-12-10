# Maintainer: Marc Fehling <mafehling.git@gmail.com>
pkgname=('python-sphinx-comments')
_pkgname=('sphinx-comments')
pkgver='0.0.3'
pkgrel=2
pkgdesc="hypothes.is interaction layer with Sphinx."
url="https://github.com/executablebooks/sphinx-comments"
depends=('python'
  'python-setuptools'
  'python-sphinx'
)
checkdepends=()
makedepends=()
license=('MIT')
arch=("any")  
source=("${_pkgname}-${pkgver}.tgz::https://github.com/executablebooks/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f0978c3f8eeb4f10711493f11cd8c6c0fc3dd61899ed593660c728741c331b40')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
