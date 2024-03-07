pkgname=python-pylpsd
_pkgname=py-lpsd
# Maintainer: Patschke
pkgver=0.1.4
pkgrel=1
pkgdesc='Python implementation of the lpsd algorithm for computing power spectral density with logarithmically spaced points'
arch=('any')
url='https://github.com/bleykauf/py-lpsd/'
license=('MIT')
depends=('python' 'python-setuptools' 'python-numpy' 'python-scipy')
source=("https://github.com/bleykauf/py-lpsd/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cee064a2eac917b02493841327317214deeac38eece468f351323608b09b78a0')

build() {
  cd "$_pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --prefix=/usr -O1 --skip-build
}
