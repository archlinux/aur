# Maintainer: Anatol Pomozov <anatol dot pomozov at gmail>

pkgname=ec-devutil-git
pkgver=r8583.6589e15e42
pkgrel=1
pkgdesc='Host development utilities for Chromium OS EC'
url='https://www.chromium.org/chromium-os/ec-development'
arch=(any)
provides=(ec-devutil python2-ec3po-git)
depends=(python2)
license=(BSD)
source=(git+https://chromium.googlesource.com/chromiumos/platform/ec)
sha1sums=('SKIP')

pkgver() {
  cd ec
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd ec
  python2 setup.py test
}

package() {
  cd ec
  python2 setup.py install --root="$pkgdir" --optimize=1
}
