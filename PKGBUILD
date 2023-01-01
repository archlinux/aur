# Maintainer: Bozo Kopic <bozo@kopic.xyz>

_name=hat-aio
pkgname=python-$_name
pkgver=0.7.3
pkgrel=1
pkgdesc="Hat async utility library"
url="https://github.com/hat-open/hat-aio"
license=('Apache')
arch=('any')
depends=('python-hat-util')
makedepends=('python-hat-doit' 'python-installer')
source=("https://github.com/hat-open/hat-aio/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('48974816473754ca85fc97fa28b6b6cd7ac840040a2b2fcd1c6ad9544ddf40ab')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m doit
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" build/py/dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
