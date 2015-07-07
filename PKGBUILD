# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-graphcanvas
pkgver=4.0.2
pkgrel=1
pkgdesc="Interactive Graph (network) Visualization"
arch=('any')
url="https://github.com/enthought/graphcanvas"
license=('BSD')
depends=('python2-networkx' 'python2-enable')
makedepends=('python2-distribute')
conflicts=('python2-graphcanvas-git' 'python-ets-graphcanvas-svn')
options=(!emptydirs)

source=("https://github.com/enthought/graphcanvas/archive/${pkgver}.tar.gz"
        "LICENSE.txt")
md5sums=('f1652f04646b9210300244b4a70079b0'
         'ae6f5df0e6d4dd4ea3cc20aafb2dd10f')

build() {
  cd "$srcdir"/graphcanvas-$pkgver

  python2 setup.py build
}

package() {
  cd "$srcdir"/graphcanvas-$pkgver

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  install -D "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

