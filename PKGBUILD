# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=ffaudioconverter
pkgver=0.13.0
pkgrel=1
pkgdesc="Simple FFmpeg DnD GUI for converting audio files"
arch=('i686' 'x86_64')
url="https://github.com/Bleuzen/FFaudioConverter/"
license=(MIT)
depends=('qt5-base' 'ffmpeg')
source=("https://github.com/Bleuzen/FFaudioConverter/releases/download/v$pkgver/FFaudioConverter-$pkgver.tar.xz")
sha256sums=('58b42942438b5d78f276859dfd684ab64beb2b0924b636b2980925aae998e107')

build() {
  qmake PREFIX=${pkgdir}/usr FFaudioConverter.pro -spec linux-g++
  make
}

package() {
  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make install
}
