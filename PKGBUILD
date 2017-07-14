# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=jupyter_dashboards
pkgver=0.7.0
pkgrel=1
pkgdesc='Extension for deploying jupyter notebooks as dynamic dashboards'
url="https://pypi.python.org/pypi/$pkgname/"
depends=('git' 'jupyter-notebook')
license=('BSD')
arch=('any')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('69a8dcb85acda20862bd2c52b97f9c5b5f0fbc23c73c2824460269d0622b0b20')

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
