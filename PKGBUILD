# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=olivia
pkgver=r182.517136a
pkgrel=1
pkgdesc="Deadass music player for Linux"
arch=('i686' 'x86_64')
url="https://github.com/keshavbhatt/olivia"
license=('MIT')
depends=('qt5-base' 'qt5-tools' 'mpv' 'python' 'wget' 'socat')
source=("git+https://github.com/keshavbhatt/olivia.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  qmake Olivia.pro -spec linux-g++ CONFIG+=release
  make
}

package() {
  # make install
  cd "$pkgname"
  mkdir -p "$pkgdir"/usr/bin/
  install -m755 "$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}
