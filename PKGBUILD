# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=zutty-git
pkgver=57.ccccbad
pkgrel=1
pkgdesc='Terminal emulator'
arch=(x86_64)
url='https://tomscii.sig7.se/zutty'
license=(GPL3)
depends=(freetype2 libglvnd libxmu)
makedepends=(git python)
source=('git+https://github.com/tomszilagyi/zutty')
sha256sums=('SKIP')

pkgver() {
  cd zutty
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd zutty
  python ./waf configure --prefix=/usr
  python ./waf build
}

package() {
  cd zutty
  python ./waf --destdir="$pkgdir" install
}
