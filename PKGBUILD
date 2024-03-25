# Maintainer: Jove Yu <yushijun110 at 126 dot com>
# Contributor: twa022 <twa022 at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma6-applets-window-buttons
pkgver=0.12.0
pkgrel=1
pkgdesc='Plasma 6 applet to show window buttons in your panels'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://github.com/moodyhunter/applet-window-buttons6'
license=(GPL)
depends=('plasma-workspace>=5.90')
makedepends=('extra-cmake-modules')
conflicts=('plasma5-applets-window-buttons')
source=("https://github.com/moodyhunter/applet-window-buttons6/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a694738653435238ddf19c78819cb67d46e658cc1157c808be4ebf58b8ec74e8')

build() {
  cmake -B build -S applet-window-buttons6-${pkgver}
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
