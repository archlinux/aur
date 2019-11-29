pkgname=python-fdutil
pkgver=1.13.0
pkgrel=1
pkgdesc="A collection of python utilities for manipulating files and data"
url="https://bitbucket.org/davisowb/fdutil"
arch=(any)
license=('MIT')
makedepends=('python-setuptools')
depends=(python-pyperclip python-logging-helper python-conversionutil python-watchdog python-dominate python-future)
source=("https://pypi.io/packages/source/f/fdutil/fdutil-${pkgver}.tar.gz")
sha256sums=('adf56d3b76af134456eb2edfc4f009adf6e276d6915d80ac6f9ed799f9472b4c')

prepare() {
  cd "${srcdir}"/fdutil-$pkgver
}

build() {
  cd "${srcdir}"/fdutil-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/fdutil-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}
