# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=ffaudioconverter
pkgver=0.30.0
pkgrel=1
pkgdesc="Graphical audio converter"
arch=('i686' 'x86_64')
url="https://github.com/Bleuzen/FFaudioConverter/"
license=('GPL3')
depends=('qt5-base' 'qt5-tools' 'ffmpeg')
source=("https://github.com/Bleuzen/FFaudioConverter/releases/download/v$pkgver/FFaudioConverter-$pkgver-src.tar.xz")
sha256sums=('ed4fae8b6d45db346b93c25045984299b0f731d38137cd3e8d1b81281210f21e')

build() {
  qmake PREFIX="${pkgdir}/usr" FFaudioConverter.pro -spec linux-g++ CONFIG+=release
  make
}

package() {
  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make DESTDIR="$pkgdir/usr" install
}
