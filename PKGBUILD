# Maintainer: Francesco Zardi <frazar0 [at] hotmail .dot. it>

_pkgname=lxml-stubs
pkgname=python-$_pkgname
pkgver=0.5.0
pkgrel=1
pkgdesc='Type stubs for the lxml package '
arch=('any')
url="https://github.com/lxml/$_pkgname"
license=('APACHE')
depends=()
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/${_pkgname:0:4}/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('97ed032dbc3a3978cddcbd4a948eb9f665292874160a014ed208f1e267c5ed927553bc3a329fa1daa48f9bc548c076945bb485b9a95c50aa780b18850918b146')

build() {
  cd $_pkgname-$pkgver

  python -m build -nw
}

package() {
  cd $_pkgname-$pkgver

  python -m installer -d "$pkgdir" dist/*.whl
}
