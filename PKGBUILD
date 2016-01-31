# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>

_pkgname=pytest-subtesthack
pkgname=python-${_pkgname}
pkgver=0.1.0
pkgrel=1
pkgdesc="A hack to explicitly set up and tear down fixtures"
arch=('any')
url="https://github.com/untitaker/${_pkgname}"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-pytest')
source=(${_pkgname}-${pkgver}.tar.gz::"https://github.com/untitaker/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('bf939a20159c749f77d900ef002ca0f80fb32345ef568337c72e2f4624a4c4d9')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
