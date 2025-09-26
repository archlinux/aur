# Maintainer: neXyon <https://aur.archlinux.org/account/nexyon>

_pkgname=ahocorapy
pkgname=python-ahocorapy
pkgver=1.6.2
pkgrel=1
pkgdesc="ahocorapy is a pure python implementation of the Aho-Corasick Algorithm."
arch=('any')
url='https://github.com/abusix/ahocorapy'
license=('MIT')
depends=(python)
makedepends=(python-setuptools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('aad3c544ac6194bc863edf3a793e42050276e52e1c1a69c25b95e4d76802ba51')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}/"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

