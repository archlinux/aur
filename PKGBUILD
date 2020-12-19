#Maintainer: Dylan Delgado <dylan1496 at live dot com>

pkgname=python-metar
_pipname=metar
pkgver=1.7.0
pkgrel=1
pkgdesc="a Python package to parse METAR-coded weather reports"
url="https://github.com/python-metar/python-metar"
arch=('x86_64')
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/70/48/c0b746fcccde312d990b43be79726791f0d7b10a099693c520d2d29a85f8/${_pipname}-${pkgver}.tar.gz"
"LICENSE")
sha256sums=("bee673dab1cf3767d5a5fcb8b67a2d0194f686503050ab94ffd08fd9a2f2e1e4"
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