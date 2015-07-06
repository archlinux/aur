# Maintainer:  Andre Miranda <andreldm1989 gmail com>

pkgname=kissplayer
pkgver=0.6.4
pkgrel=1
pkgdesc="KISS Player"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/kissplayer/"
license=('GPL')
depends=('fmodex' 'zlib' 'libpng' 'sqlite' 'taglib' 'fltk' 'libxpm' )
makedepends=('pkgconfig>=0.9.0' 'gettext')
provides=('kissplayer')
source=(http://downloads.sourceforge.net/kissplayer/$pkgname-$pkgver.tar.gz)
install=kissplayer.install
md5sums=('edb957ebfdc1dac505bfb7746f18638a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sh configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
