# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=faust
pkgname=python-$_pkgname
pkgver=1.10.3
pkgrel=1
pkgdesc="Python Stream Processing"
arch=('any')
url='https://github.com/robinhood/faust'
license=('BSD')
makedepends=('python-setuptools' 'cython')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('53d579e8dc20c0e681c2a1cfa36acca5e96b8295673bdbcc2cd6c9cc7a7142b0')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m755 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
