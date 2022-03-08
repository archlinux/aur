# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname='pyAttributes'
pkgname=python-${_pkgname,,}
pkgver=2.5.1
pkgrel=1
pkgdesc="Implementations of .NET-like attributes realized with Python decorators"
arch=(any)
url="https://github.com/pyTooling/$_pkgname"
license=('Apache')
depends=('python' 'python-argcomplete' 'python-pytooling')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f9979ac6cef8caa7a7ca1773d71c4a57c3526df3f5598609a8c6da0051020299')

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
