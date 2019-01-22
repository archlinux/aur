# Maintainer: Simon Brulhart <simon@brulhart.me>

pkgname='python-taxi'
pkgver=4.5.1
pkgrel=1
pkgdesc="Timesheeting tool that focuses on simplicity"
arch=('any')
license=('custom')
url="https://github.com/sephii/taxi"
depends=('python-appdirs' 'python-click' 'python-six')
makedepends=('python' 'python-setuptools')
optdepends=("python-taxi-zebra: Zebra backend for Taxi")
source=("$pkgname-$pkgver.tar.gz::https://github.com/sephii/taxi/archive/$pkgver.tar.gz")
sha512sums=('963e0c7bdc2eb273b65833d6cfecb08613a348767c2c65e421ff5dedc073f014855a22b291fb45795bd7005758d75e830e4c6650fed65ee08d93fef82993cacf')

build() {
  cd "$srcdir/taxi-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/taxi-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
