# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma6-applets-window-buttons
pkgver=0.11.1
pkgrel=2
pkgdesc='Plasma 6 applet in order to show window buttons in your panels'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://github.com/moodyhunter/applet-window-buttons6'
license=(GPL)
depends=('plasma-workspace>=5.90')
makedepends=('extra-cmake-modules' 'git')
conflicts=('libappletdecoration' 'plasma5-applets-window-buttons')
replaces=('libappletdecoration')
source=(git+${url})
sha256sums=('SKIP')

build() {
  cmake -B build -S applet-window-buttons6
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
