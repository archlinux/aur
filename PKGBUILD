# Maintainer: JSH <jsh 6 7 8 9 at g>

_pkgname=hermes-dec
pkgname=${_pkgname}-git
pkgver=r61.7c9d958
pkgrel=1
pkgdesc="A tool for reverse engineering React Native bytecode files"
arch=('any')
url="https://github.com/P1sec/hermes-dec"
license=('AGPL3')
depends=('python')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/P1sec/hermes-dec.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/hermes-dec"
  python setup.py build
}

package() {
  cd "$srcdir/hermes-dec"
  python setup.py install --root="$pkgdir" --optimize=1
}
