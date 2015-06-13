pkgname=parlance
_pkgname=Parlance
pkgver=1.4.1
pkgrel=1
pkgdesc="A framework for playing the Diplomacy board game over a network"
url="http://pypi.python.org/pypi/Parlance"
arch=("any")
license=("Artistic License 2.0")
depends=("python2")
source=("https://pypi.python.org/packages/source/P/Parlance/Parlance-1.4.1.tar.gz")
md5sums=('c6e79a31cd9bb7ecdc3f8142712a9daf')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  find . -type f -exec sed -i 's/env python/env python2/g' {} \;
}

package() {
  cd "$_pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}
