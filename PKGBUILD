# Maintainer: François CROLLET <fcrollet at gmail dot com>

pkgname=vpsplayer
pkgver=1.0.4
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
sha256sums=('200131cc5ccb1da0653617f4fc4475d508fbf4851342ed062057c35075ee878f')

build() {
  cd "VPS_Player-$pkgver"
  qmake-qt5 -makefile vpsplayer.pro
  make
}

package() {
  cd "VPS_Player-$pkgver"
  INSTALL_ROOT="$pkgdir" make install
}
