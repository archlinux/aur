# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=python-x256-git
pkgver=r20.d4bc9f7
pkgrel=1
pkgdesc="Find the nearest xterm 256 color index for an RGB"
arch=('any')
url="https://github.com/magarcia/python-x256"
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools')
source=("$pkgname::git+https://github.com/magarcia/python-x256")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  python setup.py build
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
