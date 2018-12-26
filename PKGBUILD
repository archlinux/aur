# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=ffaudioconverter
pkgver=0.15.0
pkgrel=1
pkgdesc="Graphical audio converter"
arch=('i686' 'x86_64')
url="https://github.com/Bleuzen/FFaudioConverter/"
license=('GPL')
depends=('qt5-base' 'ffmpeg')
source=("https://github.com/Bleuzen/FFaudioConverter/releases/download/v$pkgver/FFaudioConverter-$pkgver.tar.xz")
sha256sums=('da838f0a394bdbdc68142fb427f0d11e2f5373b5c0e935f188c10f84883208a2')

build() {
  qmake PREFIX=${pkgdir}/usr FFaudioConverter.pro -spec linux-g++
  make
}

package() {
  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make install
}
