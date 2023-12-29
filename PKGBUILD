# Maintainer: Bozo Kopic <bozo@kopic.xyz>

_name=hat-aio
pkgname=python-$_name
pkgver=0.7.9
pkgrel=1
pkgdesc="Hat async utility library"
url="https://github.com/hat-open/hat-aio"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-build' 'python-hat-doit' 'python-installer')
source=("https://github.com/hat-open/hat-aio/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9fba92a0a2724555a1aca6d83476379d53a7826d52698761cfbc8b3f05762e6a')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
