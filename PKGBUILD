# Maintainer: Andrew Shark <ashark at linuxcomp dot ru>

pkgname=frutool
_name=fru-tool
pkgver=4.1.0
pkgrel=1
pkgdesc="Utility for generating and converting IPMI FRU binary data files"
arch=("x86_64")
url="https://github.com/genotrance/fru-tool"
license=("MIT")
depends=()
makedepends=("python-build" "python-installer" "python-poetry" "python-setuptools" "python-wheel")

source=("$_name-$pkgver.tar.gz"::"https://github.com/genotrance/fru-tool/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("075161ac8160919759da2a9ecdff530d6979630fc3fa2bcecaac02e71c8e616d")

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
