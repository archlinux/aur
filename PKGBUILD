# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=ffaudioconverter
pkgver=0.16.1
pkgrel=1
pkgdesc="Graphical audio converter"
arch=('i686' 'x86_64')
url="https://github.com/Bleuzen/FFaudioConverter/"
license=('GPL')
depends=('qt5-base' 'ffmpeg')
source=("https://github.com/Bleuzen/FFaudioConverter/releases/download/v$pkgver/FFaudioConverter-$pkgver.tar.xz")
sha256sums=('99d80088a3258fb6c2d34089a1a69fa4901c5bc5cdd7f7832138db6dbfb71cb5')

build() {
  qmake PREFIX=${pkgdir}/usr FFaudioConverter.pro -spec linux-g++
  make
}

package() {
  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make install
}
