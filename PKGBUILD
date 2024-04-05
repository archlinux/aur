# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=dg
pkgver=1.1.0.20160916
_commit=9d9a5365c8ee28d4812062db1e9932754260d2d0
pkgrel=9
pkgdesc="A simple language that compiles to CPython bytecode"
arch=('any')
url="https://pyos.github.io/dg"
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("git+https://github.com/pyos/dg.git#commit=$_commit")
sha256sums=('b493c71df7e52595154c6720028b447493e822d0b57287862dd8d8696f358c26')

build() {
  cd dg
  python -m build --wheel --no-isolation
}

package() {
  cd dg
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
