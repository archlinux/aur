# Maintainer:  Andre Miranda <andreldm1989 gmail com>

pkgname=kissplayer
pkgver=0.7.0
pkgrel=2
pkgdesc="A Simple and Lightweight Music Player"
arch=('i686' 'x86_64')
url="https://github.com/andreldm/kissplayer"
license=('GPL')
depends=('fmodex' 'zlib' 'libpng' 'sqlite' 'taglib' 'fltk' 'libxpm' )
makedepends=('pkg-config>=0.9.0' 'gettext')
provides=('kissplayer')
source=(https://github.com/andreldm/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-linux.tar.gz)
install=kissplayer.install
md5sums=('393cb3cdc975f7ce190896be94fbc304')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sh configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
