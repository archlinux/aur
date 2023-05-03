# Maintainer: Bozo Kopic <bozo@kopic.xyz>

_name=hat-aio
pkgname=python-$_name
pkgver=0.7.7
pkgrel=1
pkgdesc="Hat async utility library"
url="https://github.com/hat-open/hat-aio"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-hat-doit' 'python-installer')
source=("https://github.com/hat-open/hat-aio/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d048a44e51ee2c2d984ab958b3ce2f4105d98b3805c0c1ca277ecca1a23c96b9')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m doit
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" build/py/dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
