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
sha256sums=('356bf97edc2c707bb817e6fac7a753bd005b28783e531b7e0773b74eb449966b')

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
