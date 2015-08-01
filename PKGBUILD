# Maintainer: Valsu [arch(at)hylia.de]

pkgname=prboom-plus
pkgver=2.5.1.3
pkgrel=1
pkgdesc="An advanced, Vanilla-compatible Doom engine based on PrBoom"
url="http://${pkgname}.sourceforge.net/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('dumb' 'fluidsynth' 'glu' 'libmad' 'portmidi' 'sdl_image' 'sdl_mixer' 'sdl_net')
conflicts=('prboom-plus-svn')
source=("http://download.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('9401c48fb0aa0a1d2d78ef0008a25993')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --disable-dogs
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" gamesdir=/usr/bin install
}

# vim:set ts=2 sw=2 et:
