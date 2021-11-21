# Maintainer: ml <>
pkgname=dcnnt
pkgver=0.6.0
pkgrel=1
pkgdesc='Yet another tool to connect Android phone with desktop similar to KDE Connect'
arch=('any')
url='https://github.com/cyanomiko/dcnnt-py'
license=('MIT')
depends=('python-crypto')
makedepends=('python-setuptools')
source=("$url/archive/$pkgver/$pkgname-py-$pkgver.tar.gz")
sha256sums=('679c36bd90edc6b0d42b7967b465fc90955a8d9b222723fe74f25ae2d0664535')

build() {
  cd "$pkgname-py-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-py-$pkgver"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  cp -a README.md doc/ -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
