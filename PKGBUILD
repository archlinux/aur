# Maintainer: Anatol Pomozov <anatol dot pomozov at gmail>

pkgname=ec-devutil-git
pkgver=r30582.b44e58aadac
pkgrel=1
pkgdesc='Host development utilities for Chromium OS EC'
url='https://www.chromium.org/chromium-os/ec-development'
arch=(any)
provides=(ec-devutil python-ec3po-git)
makedepends=(git)
depends=(python python-setuptools)
license=(BSD)
source=(git+https://chromium.googlesource.com/chromiumos/platform/ec)
sha1sums=('SKIP')

pkgver() {
  cd ec
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd ec
  python setup.py test
}

package() {
  cd ec
  python setup.py install --root="$pkgdir" --optimize=1
}
