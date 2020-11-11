# Maintainer: Morten Linderud <foxboron@archlinux.org>

pkgname=python-typed-ast
pkgver=1.4.1
pkgrel=3
pkgdesc="a fork of Python 2 and 3 ast modules with type comment support"
arch=('x86_64')
url="https://github.com/python/typed_ast"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/python/typed_ast/archive/${pkgver}.tar.gz")
sha256sums=('498a6cd88f78e4b2058092ff38c9941d61f4eba2c12b371240ba663f063adf7d')

build(){
  cd "typed_ast-$pkgver"
  python setup.py build
}

package(){
  cd "typed_ast-$pkgver"
  python setup.py install --prefix="usr/" --root="$pkgdir/" --optimize=1 --skip-build
}
