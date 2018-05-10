# Maintainer: Simon Perry <aur [at] sanxion [dot] net>

pkgname=python-pyswagger
_distname=pyswagger
pkgver=0.8.37
pkgrel=1
pkgdesc="Python client for Swagger enabled REST APIs"
arch=('any')
license=('MIT')
url="https://github.com/mission-liao/pyswagger"
makedepends=('python-setuptools' 'python-six' 'python-pyaml' 'python-validate_email-git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7a84add6ce9fa04b193984099e1d778296b7bd860e378942ea4ceaaff34e8891')

build() {
  cd "${srcdir}"/"${_distname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}"/"${_distname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

