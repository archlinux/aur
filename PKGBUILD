# Maintainer: Marek Küthe <m.k@mk16.de>

_pkgname=ripe-atlas-cousteau
pkgname=python-$_pkgname
pkgver=2.0.0
pkgrel=1
pkgdesc="Python client for RIPE ATLAS API"
arch=('x86_64')
url="https://github.com/RIPE-NCC/ripe-atlas-cousteau"
license=('GPL-3.0-or-later')
depends=('python-socketio-client' 'python-dateutil' 'python-requests')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RIPE-NCC/ripe-atlas-cousteau/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=(b98857d15e1f908b44abab9617896e4e550a430aa607b72a37584b07f8053113bbf203a20d94d830f5400f42f1957585dfffceafe072509f23863ff6fcd05fd5)

build() {
  cd "$_pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}

