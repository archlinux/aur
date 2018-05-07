pkgname=python-ghstats
pkgver=1.2.0
pkgrel=1
pkgdesc="Python script to obtain GitHub Release download count and other statistics"
url="https://pypi.org/project/ghstats/"
arch=(any)
license=('MIT')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/g/ghstats/ghstats-${pkgver}.tar.gz")
md5sums=('4e7f3548215dcc8f9814139001965bd1')

build() {
  cd "${srcdir}"/ghstats-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/ghstats-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}
