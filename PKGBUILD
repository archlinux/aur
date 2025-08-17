pkgname=onionbalance
pkgver=0.2.4
pkgrel=1
pkgdesc='Onionbalance'
arch=('any')
license=('GPL-3.0')
depends=(tor python-setuptools)
url='https://github.com/torproject/onionbalance'
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('797a30fa8900ec96d4e94e1f486717abc1a8cfd3f062084443e5c954e980cd2f')

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
