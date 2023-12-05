# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=networkmanager-openconnect-simple
_pkgname=${pkgname%-simple}
pkgver=0.0.0
pkgrel=1
pkgdesc='Simple and flexible NetworkManager support for OpenConnect in Python.'
arch=('any')
url="https://github.com/daskol/networkmanager-openconnect"
license=('MIT')
groups=()
depends=('dbus-python' 'networkmanager-openconnect' 'python-gobject')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('71d83fa0e1735aa6f38138a2715153e085bfe76aa68398c7ab461750bef4c6a1')

build() {
    python -m build -nw $srcdir/$_pkgname-$pkgver
}

package() {
  python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $srcdir/$_pkgname-$pkgver/dist/*.whl
}
