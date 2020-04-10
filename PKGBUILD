# Maintainer: Jake Jake <aur@ja-ke.tech>
# Maintainer: Cody Schafer <aur@codyps.com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=libsigrokdecode4dsl
pkgver=1.11
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
sha384sums=('82304119956e66fa0b37d0aaf31b1dbeeac8f3f4f2b3960dfd67fbbdad55a0681dd83b7bc12ecf3280dae85be18a975a')

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
