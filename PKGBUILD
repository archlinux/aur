# Maintainer: neXyon <https://aur.archlinux.org/account/nexyon>

_pkgname=natto-py
pkgname=python-natto
pkgver=1.0.1
pkgrel=1
pkgdesc="A package leveraging FFI (foreign function interface), natto-py combines the Python programming language with MeCab, the part-of-speech and morphological analyzer for the Japanese language."
arch=('any')
url='https://github.com/buruzaemon/natto-py'
license=('BSD-2-Clause')
depends=(python)
makedepends=(python-setuptools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9fb289aeb341e64395ade72fc0aa44a3237495a8c2389407bc9d3a0d81d72f66')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}/"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

