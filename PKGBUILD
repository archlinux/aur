# Maintainer: Simon Brulhart <simon@brulhart.me>

pkgname='python-taxi'
pkgver=4.4.1
pkgrel=1
pkgdesc="Timesheeting tool that focuses on simplicity"
arch=('any')
license=('custom')
url="https://github.com/sephii/taxi"
depends=('python-appdirs' 'python-click' 'python-six')
makedepends=('python' 'python-setuptools')
optdepends=("python-taxi-zebra: Zebra backend for Taxi")
source=("$pkgname-$pkgver.tar.gz::https://github.com/sephii/taxi/archive/$pkgver.tar.gz")
sha512sums=('cc1243c81ed1ea988af759a0c5de376465123e2bcdc8d7a08d80d04c1768aa1a4cccc3e2334e3ab1d449013a1eb5e4593ec6544a15eabc6e3777f136f644fd2a')

build() {
  cd "$srcdir/taxi-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/taxi-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
