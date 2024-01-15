# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-typst-mpl-backend
_pkgname=${pkgname#python-}
pkgver=0.1.0
pkgrel=1
pkgdesc='Typst backend for matplotlib (Python visualization library).'
arch=('any')
url="https://github.com/daskol/$_pkgname"
license=('MIT')
groups=()
depends=('python-matplotlib' 'typst')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('613828ac9b2069deba15634be5f7343b528c07a1235ab69c0a106e483154cf2f')

build() {
    python -m build -nw $srcdir/$_pkgname-$pkgver
}

package() {
  python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $srcdir/$_pkgname-$pkgver/dist/${_pkgname//-/_}-$pkgver-*-*.whl
}
