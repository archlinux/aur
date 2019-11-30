# Maintainer: Maikel Llamaret Heredia <llamaret@webmisolutions.com>

pkgname=mystiq
pkgver=0.3.0
pkgrel=0
pkgdesc="Qt5/C++ FFmpeg Media Converter"
arch=('i686' 'x86_64')
url='https://github.com/llamaret/mystiq/'
license=('GPL3')
depends=('ffmpeg' 'qt5-base' 'sox' 'libnotify' 'mplayer')
source=('https://github.com/llamaret/mystiq/archive/v0.3.0.tar.gz')
sha256sums=('4ef30a4af13950464bd38911852f0368cace1706e9d5de2334b0db2269de57de')

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
