# Maintainer: Simon Brulhart <simon@brulhart.me>

pkgname='python-taxi'
pkgver=4.5.0
pkgrel=1
pkgdesc="Timesheeting tool that focuses on simplicity"
arch=('any')
license=('custom')
url="https://github.com/sephii/taxi"
depends=('python-appdirs' 'python-click' 'python-six')
makedepends=('python' 'python-setuptools')
optdepends=("python-taxi-zebra: Zebra backend for Taxi")
source=("$pkgname-$pkgver.tar.gz::https://github.com/sephii/taxi/archive/$pkgver.tar.gz")
sha512sums=('cc36b98872fddc9216b5993572d075fcac2a4c08115084d28cc68397321e8d087df2c0dd023af898d923b5d8d1633f7a22b69b0f5e8d5b0676312fde76bd15dd')

build() {
  cd "$srcdir/taxi-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/taxi-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
