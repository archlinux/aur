# Maintainer: misson20000 <xenotoad@xenotoad.net>

pkgname=libtwili
pkgver=1.0.0.r0.g3a061af
pkgrel=1
pkgdesc='Small twili IO library'
arch=('any')
url='https://github.com/misson20000/twili-libnx'
license=(ISC)
options=(!strip staticlibs)
makedepends=('devkitpro-pkgbuild-helpers')
source=("git+https://github.com/misson20000/twili-libnx.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/twili-libnx"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/twili-libnx"

  make
}

package() {
  cd "$srcdir/twili-libnx"

  source /opt/devkitpro/devkita64.sh
  source /opt/devkitpro/switchvars.sh

  make DESTDIR="$pkgdir"${PORTLIBS_PREFIX} install
}
