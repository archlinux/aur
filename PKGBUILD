pkgname=('python2-meliae')
pkgver=0.4.0
pkgrel=1
pkgdesc="Python Memory Usage Analyzer"
url="https://launchpad.net/meliae"
arch=(any)
license=('GPL')
makedepends=('python2-setuptools' 'cython2')
depends=('python2')
source=("https://pypi.io/packages/source/m/meliae/meliae-${pkgver}.tar.gz")
md5sums=('c704f4a314927fe96919018f67b2d3f3')

prepare() {
  cd "${srcdir}"/meliae-$pkgver
}

build() {
  cd "${srcdir}"/meliae-$pkgver
  python2 setup.py build
}

package() {
  cd "${srcdir}/meliae-$pkgver"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

