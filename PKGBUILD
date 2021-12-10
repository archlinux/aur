# Maintainer: Marc Fehling <mafehling.git@gmail.com>
pkgname=('python-sphinx-external-toc')
_pkgname=('sphinx-external-toc')
pkgver='0.2.3'
pkgrel=1
pkgdesc="A sphinx extension that allows the site-map to be defined in a single YAML file."
url="https://github.com/executablebooks/sphinx-external-toc"
depends=('python'
  'python-setuptools'
  'python-attrs'
  'python-click'
  'python-yaml'
  'python-sphinx'
)
checkdepends=()
makedepends=()
license=('MIT')
arch=("any")  
source=("${_pkgname}-${pkgver}.tgz::https://github.com/executablebooks/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('e90a98bb5442120769f9470f9d7f52e9fe958bbc765e6ed669f19ddb4f53b864')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
