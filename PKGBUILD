# $Id$
# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=directfb
pkgver=1.7.1
pkgrel=2
pkgdesc="A thin library that provides hardware graphics acceleration, input device handling and abstraction, integrated windowing system on top of the Linux Framebuffer Device"
arch=('i686' 'x86_64')
url="http://www.directfb.org"
license=('LGPL')
depends=('gcc-libs' 'libjpeg' 'sdl' 'libpng' 'freetype2' 'libdrm' 'libgl' 'mesa')
source=(http://www.directfb.org/downloads/Core/DirectFB-${pkgver%.*}/DirectFB-${pkgver}.tar.gz)
sha1sums=('095852479098a55be2b0c6a0250af4159ee16e7c')
sha1sums=('ff3dc6885f2875586849d88ee9f87fca866259b0')

build() {
  cd DirectFB-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --enable-static \
    --enable-zlib --enable-x11 --enable-sdl --disable-vnc --disable-osx \
    --enable-video4linux2 --enable-voodoo \
    --enable-mesa --enable-drmkms
  make
} 

package() {
  cd DirectFB-${pkgver}
  make DESTDIR="${pkgdir}" install
}
