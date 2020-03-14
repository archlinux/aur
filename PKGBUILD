# Maintainer: Jake Jake <aur@ja-ke.tech>
# Maintainer: Cody Schafer <aur@codyps.com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=libsigrokdecode4dsl
pkgver=1.10
pkgrel=1
pkgdesc='A library which provides the basic sigrok protocol decoders for DreamSourceLab hardware'
url='https://github.com/DreamSourceLab/DSView'
arch=(i686 x86_64)
license=(GPL3)
depends=(python glib2)
makedepends=(git)
source=(
  "DSView-$pkgver.tar.gz::https://github.com/DreamSourceLab/DSView/archive/v${pkgver}.tar.gz"
)
sha384sums=('6cd82ee9c729db48f86aa00c492eb7e18a8b444d3bd7a384fbd7433e24758d7190ef88082457111b752d28c28145d9a5')

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
