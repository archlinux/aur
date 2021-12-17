# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname='pyAttributes'
pkgname=python-${_pkgname,,}
pkgver=2.3.4
pkgrel=1
pkgdesc="Implementations of .NET-like attributes realized with Python decorators"
arch=(any)
url="https://github.com/pyTooling/$_pkgname"
license=('Apache')
depends=('python' 'python-argcomplete' 'python-pytooling')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d54240740967ae73e6066a8ff184a48e4ae5a25220d821b14f195d4e136c6513')

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
