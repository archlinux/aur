pkgname=python-timingsutil
pkgver=1.6.0
pkgrel=1
pkgdesc="A collection of timing utilities"
url="https://bitbucket.org/daycoder/timingsutil"
arch=(any)
license=('MIT')
makedepends=('python-setuptools')
depends=('python-logging-helper')
source=("https://pypi.io/packages/source/t/timingsutil/timingsutil-${pkgver}.tar.gz")
sha256sums=('6978c73bfeb81cedd2eab4be1600aab8f8b7f323597552523c2dfadd29f28367')

prepare() {
  cd "${srcdir}"/timingsutil-$pkgver
}

build() {
  cd "${srcdir}"/timingsutil-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/timingsutil-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}


