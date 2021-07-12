# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname='pyMetaClasses'
pkgname=python-${_pkgname,,}
pkgver=1.2.1
pkgrel=1
pkgdesc="A collection of MetaClasses for Python"
arch=(any)
url="https://github.com/Paebbels/pyMetaClasses"
license=('Apache')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('34644093c43858b95fdae79f6d5611aa3fb28bb745ef1fef26feaf7ef71db61f')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

check(){
  cd "$_pkgname-$pkgver"
  #pytest
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
