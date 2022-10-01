pkgname=python-fmpy
pkgver=0.3.12
pkgrel=1
pkgdesc="Simulate Functional Mockup Units (FMUs) in Python"
url="https://github.com/CATIA-Systems/FMPy"
arch=(any)
license=('BSD')
depends=('python-numpy' 'python-attrs' 'python-lxml' 'python-pytz' 'python-msgpack' 'python-lark-parser')
makedepends=('python-setuptools')
source=("https://github.com/CATIA-Systems/FMPy/archive/v${pkgver}.tar.gz")
md5sums=('6a128b0c812ff4f718a98a1ec8fd9906')

build() {
  cd "${srcdir}"/FMPy-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}"/FMPy-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1
}
