# Maintainer: Morten Linderud <foxboron@archlinux.org>

pkgname=python-typed-ast
pkgver=1.5.3
pkgrel=1
pkgdesc="a fork of Python 2 and 3 ast modules with type comment support"
arch=('x86_64')
url="https://github.com/python/typed_ast"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/python/typed_ast/archive/${pkgver}.tar.gz")
sha256sums=('3d519da0252f5116650ee9a2d93f632cca1969addf434192b3f828ec1893b6dd')

build(){
  cd "typed_ast-$pkgver"
  python setup.py build
}

package(){
  cd "typed_ast-$pkgver"
  python setup.py install --prefix="usr/" --root="$pkgdir/" --optimize=1 --skip-build
}
