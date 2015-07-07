# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-etsdevtools
pkgver=4.0.2
pkgrel=1
pkgdesc="Tools to support Python development"
arch=('any')
url="https://github.com/enthought/etsdevtools"
license=('BSD')
depends=('python2-traitsui')
makedepends=('python2-distribute')
conflicts=('python2-etsdevtools-git' 'python-ets-devtools-svn')
options=(!emptydirs)

source=("https://github.com/enthought/etsdevtools/archive/${pkgver}.tar.gz")
md5sums=('210a0085029bc2e4102f3e29304d9eb1')

build() {
  cd "$srcdir"/etsdevtools-$pkgver

  python2 setup.py build
}

package() {
  cd "$srcdir"/etsdevtools-$pkgver

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  install -D "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

