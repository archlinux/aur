# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname='pyMetaClasses'
_reponame='pyTooling.MetaClasses'
pkgname=python-${_pkgname,,}
pkgver=1.3.1
pkgrel=2
pkgdesc="A collection of MetaClasses for Python"
arch=(any)
url="https://github.com/pyTooling/$_reponame"
license=('Apache')
depends=('python' 'python-pydecor')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0fd8a4056be79fb2ec46fb567c06e809f69ad4bbda6650f83d7b1d734b89b7de')

build() {
  cd "$_reponame-$pkgver"
  python setup.py build
}

check(){
  cd "$_reponame-$pkgver"
  pytest tests/
}

package() {
  cd "$_reponame-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
