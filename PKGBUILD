# Maintainer: Maikel Llamaret Heredia <llamaret@webmisolutions.com>

pkgname=mystiq
pkgver=0.3.1
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
source=('https://github.com/llamaret/mystiq/archive/v0.3.1.tar.gz')
sha256sums=('4d8d3cecab9a28ea1f5a541423764e1f1dda6aa78a5cb70046f164536abe88f8')

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
