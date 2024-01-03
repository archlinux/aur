# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-typst-mpl-backend
_pkgname=${pkgname#python-}
pkgver=0.0.0
pkgrel=2
pkgdesc='Typst backend for matplotlib (Python visualization library).'
arch=('any')
url="https://github.com/daskol/$_pkgname"
license=('MIT')
groups=()
depends=('python-matplotlib' 'typst')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('226f9acbbe08a92874ce73fc7e408c19a325fc1d2d1e2642112bd7887d473a95')

build() {
    python -m build -nw $srcdir/$_pkgname-$pkgver
}

package() {
  python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $srcdir/$_pkgname-$pkgver/dist/${_pkgname//-/_}-$pkgver-*-*.whl
}
