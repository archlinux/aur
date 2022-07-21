# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=python-pysnooper
pkgver=1.1.1
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
md5sums=('06e12ac5052dff22fafa3107f2ab9854')

prepare() {
  mkdir -p "$_pkgtag"
  tar xf "$_pkgtar" -C "$_pkgtag" --strip-components 1
}

package() {
  cd "$_pkgtag"
  python setup.py install --root "${pkgdir}"
}

# vim:set ts=2 sw=2 et:
