#Maintainer: Dylan Delgado <dylan1496 at live dot com>

pkgname=python-metar
_pipname=metar
pkgver=1.9.0
pkgrel=1
pkgdesc="a Python package to parse METAR-coded weather reports"
url="https://github.com/python-metar/python-metar"
arch=('x86_64')
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/70/e7/fba81a245852ca91cbeb105a1bf9f8228dbbeb8b6bc8679b8efc44a0a2ac/${_pipname}-${pkgver}.tar.gz"
"LICENSE")
sha256sums=("ef58a29e1ef8fed034ed493dc874aa4fbd40313e578640287dbf5c55d89886c5"
"SKIP")

build() {
  cd ${srcdir}/${_pipname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pipname}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --skip-build
  cd ..
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
