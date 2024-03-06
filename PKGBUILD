# Maintainer: ml <>
pkgname=dcnnt
pkgver=0.10.0
pkgrel=1
pkgdesc='Yet another tool to connect Android phone with desktop similar to KDE Connect'
arch=('any')
url='https://github.com/cyanomiko/dcnnt-py'
license=('MIT')
depends=('python-pycryptodome')
makedepends=('python-setuptools')
source=("$url/archive/$pkgver/$pkgname-py-$pkgver.tar.gz")
sha256sums=('a18dfcb0c97e191e6895d518791df5f8dfc724022966d7f0dd994047066fc2c6')

build() {
  cd "$pkgname-py-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-py-$pkgver"
  install -Dm644 README.md doc/*.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
