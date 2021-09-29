pkgname=python-fmpy
pkgver=0.3.1
pkgrel=1
pkgdesc="Simulate Functional Mockup Units (FMUs) in Python"
url="https://github.com/CATIA-Systems/FMPy"
arch=(any)
license=('BSD')
depends=('python-numpy' 'python-attrs' 'python-lxml' 'python-pytz' 'python-msgpack' 'python-lark-parser')
makedepends=('python-setuptools')
source=("https://github.com/CATIA-Systems/FMPy/archive/v${pkgver}.tar.gz")
md5sums=('decb491d10b64469619e6f81b58e7758')

build() {
  cd "${srcdir}"/FMPy-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}"/FMPy-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1
}
