# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname='pyTerminalUI'
pkgname=python-${_pkgname,,}
pkgver=1.4.1
pkgrel=1
pkgdesc="A set of helpers to implement a text user interface (TUI) in a terminal"
arch=(any)
url="https://github.com/Paebbels/pyTerminalUI"
license=('Apache')
depends=('python' 'python-colorama' 'python-pydecor' 'python-pyexceptions' 'python-pymetaclasses')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('50331ed201df0de08213db19da75276862d82faeb1c5a241c5d8a1614dfeffb4')

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
