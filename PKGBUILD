# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-typst-mpl-backend
_pkgname=${pkgname#python-}
pkgver=0.0.0
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
sha256sums=('41240e2a8867c682ed32240805ca5da63c54fd64adfb7b83b5fd2c676c2d530b')

build() {
    python -m build -nw $srcdir/$_pkgname-$pkgver
}

package() {
  python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $srcdir/$_pkgname-$pkgver/dist/${_pkgname//-/_}-$pkgver-*-*.whl
}
