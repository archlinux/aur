# Maintainer: Morten Linderud <foxboron@archlinux.org>

pkgname=python-typed-ast
pkgver=1.4.0
pkgrel=1
pkgdesc="a fork of Python 2 and 3 ast modules with type comment support"
arch=('x86_64')
url="https://github.com/python/typed_ast"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/python/typed_ast/archive/${pkgver}.tar.gz")
sha256sums=('bd02998404953db788e9d09c1030c4f0eb9d87986b08bd30e9fc00a8e30d6dd8')

build(){
  cd "typed_ast-$pkgver"
  python setup.py build
}

package(){
  cd "typed_ast-$pkgver"
  python setup.py install --prefix="usr/" --root="$pkgdir/" --optimize=1 --skip-build
}
