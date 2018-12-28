# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=ffaudioconverter
pkgver=0.18.1
pkgrel=2
pkgdesc="Graphical audio converter"
arch=('i686' 'x86_64')
url="https://github.com/Bleuzen/FFaudioConverter/"
license=('GPL')
depends=('qt5-base' 'ffmpeg')
source=("https://github.com/Bleuzen/FFaudioConverter/releases/download/v$pkgver/FFaudioConverter-$pkgver.tar.xz")
sha256sums=('28263234891f4e079fe3a05896a070b4ba34d2842728a54e2bffd210d68afa94')

build() {
  qmake PREFIX=${pkgdir}/usr FFaudioConverter.pro -spec linux-g++
  make
}

package() {
  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make install
}
