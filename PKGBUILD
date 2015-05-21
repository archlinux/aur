pkgname=libcrystalhd
pkgver=20100703
_intver=07032010
pkgrel=3
pkgdesc="Broadcom Crystal HD library"
arch=('i686' 'x86_64')
url="http://git.wilsonet.com/crystalhd.git/"
license=('GPL2')
source=("http://www.broadcom.com/docs/support/crystalhd/crystalhd_linux_${pkgver}.zip")
md5sums=('f14c0e418b36ea14f8d25f9a7d6f7507')

prepare() {
  tar -xzf crystalhd_${_intver}.tbz2
}

build() {
  cd "${_intver}/linux_lib/libcrystalhd"
  make
}

package() {
  cd "${_intver}/linux_lib/libcrystalhd"

  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir/lib"
}
# vim:syntax=sh
