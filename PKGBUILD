# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname='pyMetaClasses'
pkgname=python-${_pkgname,,}
pkgver=1.3.0
pkgrel=1
pkgdesc="A collection of MetaClasses for Python"
arch=(any)
url="https://github.com/Paebbels/pyMetaClasses"
license=('Apache')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('eaec84f87644d2cf5fdedfbb14b570b6e483e385f42004262c462a6b2c135301')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

check(){
  cd "$_pkgname-$pkgver"
  pytest tests/
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
