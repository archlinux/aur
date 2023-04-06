# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-compiler
pkgver=1.1
pkgrel=5
pkgdesc='Python bytecode compiler written in Python'
arch=(any)
url='https://github.com/facebookincubator/python-compiler'
license=(custom)
makedepends=(git python python-setuptools)
source=("git+$url#commit=5a9a30b3d5fae5337ff449030873a58b35e875a4") # no release tags yet
b2sums=(SKIP)

build(){
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname
  python setup.py install --optimize=1 --root="$pkgdir" --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
