# Maintainer: Jove Yu <yushijun110 at 126 dot com>
# Contributor: twa022 <twa022 at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma6-applets-window-buttons
pkgver=0.13.0
pkgrel=1
pkgdesc='Plasma 6 applet to show window buttons in your panels'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://github.com/moodyhunter/applet-window-buttons6'
license=(GPL)
depends=('plasma-workspace>=5.90')
makedepends=('extra-cmake-modules')
conflicts=('plasma5-applets-window-buttons')
source=("https://github.com/moodyhunter/applet-window-buttons6/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2bca557b05528c3e738a3214cfcf9f51539170359256a1fa56f8779e85c9470a')

build() {
  cmake -B build -S applet-window-buttons6-${pkgver}
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
