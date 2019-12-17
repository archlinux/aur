# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=vermin
pkgver=0.9.0
pkgrel=1
pkgdesc="Concurrently detect the minimum Python versions needed to run code"
url="https://github.com/netromdk/$pkgname"
license=("MIT")
arch=("any")
depends=("python>=2.7")
makedepends=("python-setuptools")
_pkgtag="$pkgname-$pkgver"
_pkgtar="$_pkgtag.tar.gz"
source=("$_pkgtar::$url/archive/v$pkgver.tar.gz")
noextract=("$_pkgtar")
md5sums=('422d651f31f4d49e3b993077c243a8c1')

prepare() {
  mkdir -p "$_pkgtag"
  tar xf "$_pkgtar" -C "$_pkgtag" --strip-components 1
}

package() {
  cd "$_pkgtag"
  python setup.py install --root "${pkgdir}"
}

# vim:set ts=2 sw=2 et:
