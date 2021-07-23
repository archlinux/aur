# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname='pyMetaClasses'
pkgname=python-${_pkgname,,}
pkgver=1.3.1
pkgrel=1
pkgdesc="A collection of MetaClasses for Python"
arch=(any)
url="https://github.com/Paebbels/pyMetaClasses"
license=('Apache')
depends=('python' 'python-pydecor')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('54c1265f13304c2b9fbcff96ba10a05690a96685bb55ea39d0f43b82b837ced4')

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
