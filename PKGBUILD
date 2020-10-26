# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=ffaudioconverter
pkgver=0.29.1
pkgrel=1
pkgdesc="Graphical audio converter"
arch=('i686' 'x86_64')
url="https://github.com/Bleuzen/FFaudioConverter/"
license=('GPL3')
depends=('qt5-base' 'qt5-tools' 'ffmpeg')
source=("https://github.com/Bleuzen/FFaudioConverter/releases/download/v$pkgver/FFaudioConverter-$pkgver-src.tar.xz")
sha256sums=('8cdba99936ff3f78c2e8bf30b3141c07127dd6d24b3b3f53f3c44f7d3b4e9cfc')

build() {
  qmake PREFIX="${pkgdir}/usr" FFaudioConverter.pro -spec linux-g++ CONFIG+=release
  make
}

package() {
  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make DESTDIR="$pkgdir/usr" install
}
