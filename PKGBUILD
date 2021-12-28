# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname='pyTooling.TerminalUI'
pkgname=python-${_pkgname,,}
pkgname=${pkgname/./-}
pkgver=1.5.6
pkgrel=1
pkgdesc="A set of helpers to implement a text user interface (TUI) in a terminal"
arch=(any)
url="https://github.com/pyTooling/$_pkgname"
license=('Apache')
depends=('python' 'python-colorama' 'python-pytooling')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('014b63736d4b50a909562a16d4da81b57babea69de93f65263d73d12b360b66f')

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
