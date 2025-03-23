# Maintainer: Bozo Kopic <bozo@kopic.xyz>

_name=hat-aio
pkgname=python-$_name
pkgver=0.7.12
pkgrel=1
pkgdesc="Hat async utility library"
url="https://github.com/hat-open/hat-aio"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-build' 'python-hat-doit' 'python-installer')
source=("https://github.com/hat-open/hat-aio/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b0c93ac59aa00da9ed87dfc5bd10d8612aecfaafe6cfa4d49783dbf9e29bc013')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
