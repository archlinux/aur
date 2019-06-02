# Maintainer: Morten Linderud <foxboron@archlinux.org>

pkgname=python-typed-ast
pkgver=1.3.5
pkgrel=1
pkgdesc="a fork of Python 2 and 3 ast modules with type comment support"
arch=('x86_64')
url="https://github.com/python/typed_ast"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/python/typed_ast/archive/${pkgver}.tar.gz")
sha256sums=('9d4e521b835ed19f3cc2d43d5a0424ca6f90ffb8889c808bb4eda949f410b809')

build(){
  cd "typed_ast-$pkgver"
  python setup.py build
}

package(){
  cd "typed_ast-$pkgver"
  python setup.py install --prefix="usr/" --root="$pkgdir/" --optimize=1 --skip-build
}
