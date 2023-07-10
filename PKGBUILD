_name=pyod
pkgname="python-$_name"
pkgver=1.1.0
pkgrel=1
arch=('any')
pkgdesc="A Python 3 Library Outlier Detection or Anomaly Detection"
url="https://github.com/yzhao062/pyod"
license=('GPL3')
source=("https://github.com/yzhao062/pyod/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('839f379d6f7594feb7506b284255b5c1e09aea0ab941fe1370cca71ce879c7909a56701df3536dab76436de65f6d8f70e29c9ab697692f8e3651f103a6ab9ff0')
depends=(
  'python'
)
makedepends=('python-setuptools')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
