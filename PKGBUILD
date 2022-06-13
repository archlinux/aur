# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Felix Yan <felixonmars@archlinux.org>
pkgname=python2-cycler
_name=${pkgname#python2-}
pkgver=0.10.0
pkgrel=7
pkgdesc="Composable style cycles"
arch=('any')
license=('BSD')
url="https://github.com/matplotlib/cycler"
depends=('python2-six')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b6d217635e03024196225367b1a438996dbbf0271bec488f00584f0e7dc15cfa')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root "${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
