pkgname=python-logging-helper
pkgver=1.8.6
pkgrel=1
pkgdesc="Provides some enhancements to built-in logging module"
url="https://pypi.python.org/pypi/logging-helper"
arch=(any)
license=('MIT')
makedepends=('python-setuptools')
depends=('python-better-exceptions' 'python-future')
source=("https://pypi.io/packages/source/l/logging_helper/logging_helper-${pkgver}.tar.gz")
sha256sums=('270b7b57f163528709a162d48388518d8a109d33b014fd44893a493841549942')

prepare() {
  cd "${srcdir}"/logging_helper-$pkgver
}

build() {
  cd "${srcdir}"/logging_helper-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/logging_helper-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}


