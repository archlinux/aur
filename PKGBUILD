# Maintainer: Morten Linderud <foxboron@archlinux.org>

pkgname=python-typed-ast
pkgver=1.5.2
pkgrel=1
pkgdesc="a fork of Python 2 and 3 ast modules with type comment support"
arch=('x86_64')
url="https://github.com/python/typed_ast"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/python/typed_ast/archive/${pkgver}.tar.gz")
sha256sums=('b8475b94bf77991d2db0bcce3dc14421b8518139f2994dafcd6a7fb2e8f5e261')

build(){
  cd "typed_ast-$pkgver"
  python setup.py build
}

package(){
  cd "typed_ast-$pkgver"
  python setup.py install --prefix="usr/" --root="$pkgdir/" --optimize=1 --skip-build
}
