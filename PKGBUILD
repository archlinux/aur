# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma6-applets-window-buttons
epoch=1
pkgver=r183.7d9cb3e
pkgrel=1
pkgdesc='Plasma 6 applet in order to show window buttons in your panels'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://github.com/moodyhunter/applet-window-buttons6'
license=(GPL)
depends=('plasma-workspace>=5.90')
makedepends=('extra-cmake-modules' 'git')
conflicts=('libappletdecoration' 'plasma5-applets-window-buttons')
replaces=('libappletdecoration')
_commit=7d9cb3ea77ea1dae81c20a590b18a182f6c4b45c
source=(git+${url}#commit=${_commit})
sha256sums=('SKIP')

pkgver() {
  cd applet-window-buttons6
  printf "r%s.%s" `git rev-list HEAD --count` `git rev-parse --short HEAD`
}

build() {
  cmake -B build -S applet-window-buttons6
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
