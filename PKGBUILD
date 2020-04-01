# Maintainer: François CROLLET <fcrollet at gmail dot com>

pkgname=vpsplayer
pkgver=1.0.3
pkgrel=1
pkgdesc="High quality Variable Pitch and Speed audio player"
arch=('x86_64')
url="https://github.com/fcrollet/vpsplayer"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'rubberband')
optdepends=('gst-plugins-base: "Base" set of codecs'
            'gst-plugins-good: "Good" additional codecs'
	    'gst-plugins-bad: "Bad" additional codecs'
	    'gst-plugins-ugly: "Ugly" additional codecs')
source=("https://github.com/fcrollet/vpsplayer/releases/download/v$pkgver/VPS_Player-$pkgver.tar.xz")
sha256sums=('9a548867eb84b421305bf3b38d35562d8fec3df238e51313f94cd2c47a67d37d')

build() {
  cd "VPS_Player-$pkgver"
  qmake-qt5 -makefile vpsplayer.pro
  make
}

package() {
  cd "VPS_Player-$pkgver"
  INSTALL_ROOT="$pkgdir" make install
}
