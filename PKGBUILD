# Maintainer: Maikel Llamaret Heredia <llamaret@webmisolutions.com>

pkgname=mystiq
pkgver=0.3.2
pkgrel=0
pkgdesc="Qt5/C++ FFmpeg Media Converter"
arch=('i686' 'x86_64')
url='https://github.com/llamaret/mystiq/'
license=('GPL3')
depends=('ffmpeg' 'qt5-base')
optdepends=('sox: audio speed adjusting support'
				'libnotify: display desktop notifications'
				'mplayer: video cutting preview')
makedepends=('make' 'gcc' 'pkg-config' 'qt5-tools' 'fakeroot')				
source=('https://github.com/llamaret/mystiq/archive/v0.3.2.tar.gz')
sha256sums=('8883a2d6f448e7426fdd592c2d0ee8f64c7d778b1b1c203c83be6873c4d7b86b')

build() {
  cd "$srcdir/MystiQ-${pkgver}"
  qmake mystiq.pro
  make 
  strip mystiq
}

package() {
  cd "$srcdir/MystiQ-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
}
