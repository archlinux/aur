# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=ffaudioconverter
pkgver=0.20.1
pkgrel=1
pkgdesc="Graphical audio converter"
arch=('i686' 'x86_64')
url="https://github.com/Bleuzen/FFaudioConverter/"
license=('GPL')
depends=('qt5-base' 'ffmpeg')
source=("https://github.com/Bleuzen/FFaudioConverter/releases/download/v$pkgver/FFaudioConverter-$pkgver.tar.xz")
sha256sums=('d3bffe0bbc738999d6a7ab5d46b7816dac0573b3b4d635d87bc2968dc822f9d6')

build() {
  qmake PREFIX=${pkgdir}/usr FFaudioConverter.pro -spec linux-g++ CONFIG+=release
  make
}

package() {
  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make install
}
