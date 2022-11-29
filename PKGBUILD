# Maintainer: graysky <therealgraysky AT proton DOT me>

pkgname=snort3-extra
_pkgname=snort3_extra
pkgver=3.1.42.0
pkgrel=1
pkgdesc='Snort extra plugins'
arch=(x86_64 armv7h aarch64)
url='https://github.com/snort3/snort3_extra'
license=(GPL)
depends=(snort)
makedepends=(cmake pkgconf)
source=("$pkgname-$pkgver.tar.gz::https://github.com/snort3/snort3_extra/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2ae4a10aef40fbd6c38675055f2f446f63464fc660bfa3beea229a4119b3c837')

build() {
  cd "$_pkgname-$pkgver"
  export PKG_CONFIG_PATH=/usr/lib/pkgconfig
  ./configure_cmake.sh --prefix=/usr
  make -C build
}

package() {
  cd "$_pkgname-$pkgver"
  make -C build DESTDIR="$pkgdir" install
}

