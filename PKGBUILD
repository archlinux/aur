#Maintainer: Dylan Delgado <dylan1496 at live dot com>

pkgname=python-metar
_pipname=metar
pkgver=1.8.0
pkgrel=1
pkgdesc="a Python package to parse METAR-coded weather reports"
url="https://github.com/python-metar/python-metar"
arch=('x86_64')
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/fa/3b/5ca06c3e300a4bf6259663684943f058a44575500c9953a56650540d7780/${_pipname}-${pkgver}.tar.gz"
"LICENSE")
sha256sums=("d23494c5dcb81a857de9f4022cab0cf3d37277a32f675a9e1491e817d56f8428"
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