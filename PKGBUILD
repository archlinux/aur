# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=python-pysnooper
pkgver=1.2.0
pkgrel=1
pkgdesc="PySnooper - Never use print for debugging again"
url="https://github.com/cool-RR/PySnooper"
license=("MIT")
arch=("any")
depends=("python>=2.7")
makedepends=("python-setuptools")
_pkgtag="$pkgname-$pkgver"
_pkgtar="$_pkgtag.tar.gz"
source=("$_pkgtar::$url/archive/$pkgver.tar.gz")
noextract=("$_pkgtar")
md5sums=('b1950ee057602a72a447a5119fc59a70')

prepare() {
  mkdir -p "$_pkgtag"
  tar xf "$_pkgtar" -C "$_pkgtag" --strip-components 1
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation 2>/dev/null
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
