pkgname='dvblast'
pkgver='3.0'
pkgrel='1'
arch=('i686' 'x86_64')
license=('GPL2')
pkgdesc='DVBlast is a simple and powerful MPEG-2/TS demux and streaming application.'
url='https://www.videolan.org/projects/dvblast.html'
depends=('libev')
makedepends=('bitstream')
source=(https://downloads.videolan.org/pub/videolan/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('89ea9ffb16476d47b8853e52a8a3ee63')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=usr DESTDIR="$pkgdir/" install || return 1
}
