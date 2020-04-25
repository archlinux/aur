# Maintainer: Simon Perry <aur [at] sanxion [dot] net>

pkgname=python-pyswagger
_distname=pyswagger
pkgver=0.8.39
pkgrel=1
pkgdesc="Python client for Swagger enabled REST APIs"
arch=('any')
license=('MIT')
url="https://github.com/mission-liao/pyswagger"
makedepends=('python-setuptools')
depends=('python-six' 'python-pyaml' 'python-validate_email-git')
source=("${_distname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('637b6f7a665b247777484f83e5a5fe476795554e85385b4889fc244b182b063e')

build() {
  cd "${srcdir}"/"${_distname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}"/"${_distname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

