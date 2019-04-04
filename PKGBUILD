# Maintainer: Simon Perry <aur [at] sanxion [dot] net>

pkgname=python-pyswagger
_distname=pyswagger
pkgver=0.8.38
pkgrel=1
pkgdesc="Python client for Swagger enabled REST APIs"
arch=('any')
license=('MIT')
url="https://github.com/mission-liao/pyswagger"
makedepends=('python-setuptools' 'python-six' 'python-pyaml' 'python-validate_email-git')
source=("${_distname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0cc0b5f05494589c7928fe632243803ebb4da4bf22c0826ed81620a02db1d302')

build() {
  cd "${srcdir}"/"${_distname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}"/"${_distname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

