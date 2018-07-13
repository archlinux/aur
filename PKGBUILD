# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
pkgname=python2-entrypoints
_pkgname=${pkgname#python2-}
pkgver=0.2.3
pkgrel=1
pkgdesc="Discover and load entry points from installed packages."
arch=('any')
url="https://github.com/takluyver/entrypoints"
license=('MIT')
depends=('python2-configparser')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://pypi.io/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('d2d587dde06f99545fb13a383d2cd336a8ff1f359c5839ce3a64c917d10c029f')

build() {
  cd "$srcdir"/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
