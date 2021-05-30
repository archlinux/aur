# Maintainer: Marc Fehling <mafehling.git@gmail.com>
pkgname=('python-sphinx-external-toc')
_pkgname=('sphinx-external-toc')
pkgver='0.2.0'
pkgrel=1
pkgdesc="A sphinx extension that allows the site-map to be defined in a single YAML file."
url="https://github.com/executablebooks/sphinx-external-toc"
depends=('python'
  'python-setuptools'
  'python-attrs'
  'python-click'
  'python-pyaml'
  'python-sphinx'
)
checkdepends=()
makedepends=()
license=('MIT')
arch=("any")  
source=("${_pkgname}-${pkgver}.tgz::https://github.com/executablebooks/sphinx-external-toc/archive/v${pkgver}.tar.gz")
sha256sums=('5b2007e996972d1e3f78cc6d703cdee64aa933148cec28323dd10475692d3360')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
