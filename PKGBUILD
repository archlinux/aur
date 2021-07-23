# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname='pyAttributes'
pkgname=python-${_pkgname,,}
pkgver=2.2.1
pkgrel=1
pkgdesc="Implementations of .NET-like attributes realized with Python decorators"
arch=(any)
url="https://github.com/Paebbels/pyAttributes"
license=('Apache')
depends=('python-argcomplete' 'python-pydecor')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4e845cec75053bc662bf014d0b584b56bce85670ce99ae6f0c3d38410d58e4f4')

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
