
pkgname=python2-pyhamcrest
# Do not update. 1.10.1 is the last version supporting Python2
pkgver=1.10.1
pkgrel=1
pkgdesc="Hamcrest framework for matcher objects (1.10.x is the last version supporting Python 2)"
arch=('any')
license=('BSD')
url="https://github.com/hamcrest/PyHamcrest"
depends=('python2-six')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tgz::https://github.com/hamcrest/PyHamcrest/archive/refs/tags/V$pkgver.tar.gz")
sha512sums=('f7e79f7d26c4c6add042052e451898bbf5adf21b05a234cc62bce890d68f5997693b042a9daf136f7026040a8ab7bf28b829288417b947973dcb959bf613a37b')

build() {
  cd PyHamcrest-$pkgver
  python2 setup.py build
}

package() {
  cd PyHamcrest-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
