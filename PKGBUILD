# Maintainer: Cody Schafer <aur@codyps.com>
# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=libsigrokdecode4dsl
pkgver=0.98
pkgrel=1
pkgdesc='A library which provides the basic sigrok protocol decoders for DreamSourceLab hardware'
url='https://github.com/DreamSourceLab/DSView'
arch=(i686 x86_64)
license=(GPL3)
depends=(python glib2)
makedepends=(git)
source=("git://github.com/DreamSourceLab/DSView.git#tag=$pkgver")
sha1sums=('SKIP')

build() {
  cd DSView/libsigrokdecode4DSL

  ./autogen.sh
  ./configure --prefix=/usr

  make
}

package() {
  cd DSView/libsigrokdecode4DSL
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
