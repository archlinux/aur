# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=ffaudioconverter
pkgver=0.27
pkgrel=1
pkgdesc="Graphical audio converter"
arch=('i686' 'x86_64')
url="https://github.com/Bleuzen/FFaudioConverter/"
license=('GPL3')
depends=('qt5-base' 'qt5-tools' 'ffmpeg')
source=("https://github.com/Bleuzen/FFaudioConverter/releases/download/v$pkgver/FFaudioConverter-$pkgver-src.tar.xz")
sha256sums=('34ef6521390e917f1031f4c73ce863cb0ab67943b5d16509900ad82f2e025a7c')

build() {
  qmake PREFIX="${pkgdir}/usr" FFaudioConverter.pro -spec linux-g++ CONFIG+=release
  make
}

package() {
  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make DESTDIR="$pkgdir/usr" install
}
