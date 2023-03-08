# Maintainer: Bozo Kopic <bozo@kopic.xyz>

_name=hat-aio
pkgname=python-$_name
pkgver=0.7.5
pkgrel=1
pkgdesc="Hat async utility library"
url="https://github.com/hat-open/hat-aio"
license=('Apache')
arch=('any')
depends=('python-hat-util')
makedepends=('python-hat-doit' 'python-installer')
source=("https://github.com/hat-open/hat-aio/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('71f215e9c08ac3a76acd23be05e431ec085715df238f0c59b115735ac94b2f9e')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m doit
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" build/py/dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
