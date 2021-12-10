# Maintainer: Marc Fehling <mafehling.git@gmail.com>
pkgname=('python-sphinx-multitoc-numbering')
_pkgname=('sphinx-multitoc-numbering')
pkgver='0.1.3'
pkgrel=1
pkgdesc="A Sphinx extension to support continuous numbering of sections across multiple tocs in HTML output."
url="https://github.com/executablebooks/sphinx-multitoc-numbering"
depends=('python'
  'python-setuptools'
  'python-sphinx'
)
checkdepends=()
makedepends=()
license=('MIT')
arch=("any")  
source=("${_pkgname}-${pkgver}.tgz::https://github.com/executablebooks/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b0fcb862471f2f3573ab36ff38407fc3142b1919300c71849e0f271ec0e06fda')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
