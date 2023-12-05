# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=networkmanager-openconnect-simple
_pkgname=${pkgname%-simple}
pkgver=0.0.0
pkgrel=2
pkgdesc='Simple and flexible NetworkManager support for OpenConnect in Python.'
arch=('any')
url="https://github.com/daskol/networkmanager-openconnect"
license=('MIT')
groups=()
depends=('dbus-python' 'networkmanager-openconnect' 'python-gobject')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('05bf84df13684e8b3d7e2d07d9291be21dc5f7693bbe1b4fa648aba5e008e694')

build() {
    python -m build -nw $srcdir/$_pkgname-$pkgver
}

package() {
  python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $srcdir/$_pkgname-$pkgver/dist/*.whl
}
