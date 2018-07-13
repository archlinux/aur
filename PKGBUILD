# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
pkgname=python-parver
_pkgname=${pkgname#python-}
pkgver=0.1.1
pkgrel=1
pkgdesc=" Parse and manipulate version numbers."
arch=('any')
url="https://github.com/RazerM/parver"
license=('Apache')
depends=('python-arpeggio' 'python-attrs' 'python-six')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b8a43246df0db98f44bceb2c788fb92d1e536cf56cda73f326d7b0b9ecc537f0')

build() {
  cd "$srcdir"/$_pkgname-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
