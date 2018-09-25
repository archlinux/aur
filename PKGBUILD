# Maintainer: Simon Brulhart <simon@brulhart.me>

pkgname='python-taxi'
pkgver=4.4.2
pkgrel=1
pkgdesc="Timesheeting tool that focuses on simplicity"
arch=('any')
license=('custom')
url="https://github.com/sephii/taxi"
depends=('python-appdirs' 'python-click' 'python-six')
makedepends=('python' 'python-setuptools')
optdepends=("python-taxi-zebra: Zebra backend for Taxi")
source=("$pkgname-$pkgver.tar.gz::https://github.com/sephii/taxi/archive/$pkgver.tar.gz")
sha512sums=('d9525dfb278bb4c9832086122f1442825e510db2a69730c8367ffe6447785111162f8b63629fc02e6920315a404bfc3e00009d12dcb247a69d334076de8ec788')

build() {
  cd "$srcdir/taxi-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/taxi-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
