# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=zutty
pkgver=0.6
pkgrel=1
pkgdesc='Terminal emulator'
arch=(x86_64)
url='https://tomscii.sig7.se/zutty'
license=(GPL3)
depends=(freetype2 libglvnd libxmu)
makedepends=(git python)
source=('git+https://github.com/tomszilagyi/zutty#commit=71f7fc9f03cdc2f38d9dca1f9e5f279899dbc568') # tag: 0.6
sha256sums=('SKIP')

build() {
  cd zutty
  python ./waf configure --prefix=/usr
  python ./waf build
}

package() {
  cd zutty
  python ./waf --destdir="$pkgdir" install
}
