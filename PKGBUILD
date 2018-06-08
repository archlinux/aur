# Maintainer:  Andre Miranda <andre42m gmail com>

pkgname=kissplayer
pkgver=0.7.1
pkgrel=2
pkgdesc="A Simple and Lightweight Music Player"
arch=('i686' 'x86_64')
url="https://github.com/andreldm/kissplayer"
license=('GPL')
depends=('fmodex' 'zlib' 'libpng' 'sqlite' 'taglib' 'fltk' 'libxpm' )
makedepends=('pkgconf>=0.9.0' 'gettext')
provides=('kissplayer')
source=(https://github.com/andreldm/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-linux.tar.gz)
install=kissplayer.install
sha256sums=('29aa056f41c1ba556315e47181dad1b70d234519c7436c31c810e580e9c2a870')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sh configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
