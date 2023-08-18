#Maintainer: Dylan Delgado <dylan1496 at live dot com>

pkgname=python-metar
_pipname=metar
pkgver=1.11.0
pkgrel=1
pkgdesc="a Python package to parse METAR-coded weather reports"
url="https://github.com/python-metar/python-metar"
arch=('x86_64')
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/b1/9f/a3444d145b833699c603ed87b5565dcb2ebf9235d85f8229bb25c5047b37/${_pipname}-${pkgver}.tar.gz"
"LICENSE")
sha256sums=("0e40e86eb03fdfafef71b14d74349e88e208bd4dc15e8734b3afcf129125378b"
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
