# Maintainer: Cody Schafer <aur@codyps.com>
# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=libsigrokdecode4dsl
pkgver=0.99
pkgrel=1
pkgdesc='A library which provides the basic sigrok protocol decoders for DreamSourceLab hardware'
url='https://github.com/DreamSourceLab/DSView'
arch=(i686 x86_64)
license=(GPL3)
depends=(python glib2)
makedepends=(git)
source=(
  "DSView-$pkgver.tar.gz::https://github.com/DreamSourceLab/DSView/archive/${pkgver}.tar.gz"
)
sha384sums=('9f92432c1721d5e39b343029955c95203bf9cf051095956175e7315e0471bbc01c8ba85708ed3eb085a7cf75932adb6c')

_wdir() {
	cd "$srcdir/DSView-$pkgver/libsigrokdecode4DSL"
}

build() {
  _wdir

  ./autogen.sh
  ./configure --prefix=/usr

  make
}

package() {
  _wdir
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
