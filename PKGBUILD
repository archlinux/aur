# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname='pid-tools'
pkgdesc="Some commandline tools for dealing with pids, information about processes, and their relations"
pkgver=3.0.0
pkgrel=1
arch=('any')
license=('GPLv2')
url="http://github.com/kata198/pid-tools"
makedepends=('gcc' 'make')
source=("https://github.com/kata198/pid-tools/archive/${pkgver}.tar.gz")
sha512sums=("6d3c652f33e1a3fe983cea3506d7ac4390a520ec9a9dd993f803007f429e90ff83265a10d1aaf491c06377df7b868a114521511a6f20bce5832f674d8e0c6c00")

build() {
  cd "$srcdir/${pkgname}-$pkgver"

  make
}

package() {
  cd "${pkgname}-$pkgver"

  # Bug in MAKEFILE, have to end DESTDIR with /usr
  make install DESTDIR="${pkgdir}/usr"
}

