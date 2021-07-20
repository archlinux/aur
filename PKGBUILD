# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname='pyAttributes'
pkgname=python-${_pkgname,,}
pkgver=2.2.0
pkgrel=1
pkgdesc="Implementations of .NET-like attributes realized with Python decorators"
arch=(any)
url="https://github.com/Paebbels/pyAttributes"
license=('Apache')
depends=('python-argcomplete')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('58403a1a8c9b2ccf5a70216b882e0f4224df872ba4399e30c230691270ab622b')

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
