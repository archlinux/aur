# Maintainer: Justin Korkie <korkie9@github.com>
pkgname=da-browser-launcher
pkgver=1.0.1
pkgrel=1
pkgdesc="Browser launcher that lets the user launch into a specific profile"
arch=('x86_64')
url="https://github.com/korkie9/da-browser-launcher"
license=('GPL-3.0-or-later')
depends=('sqlite' 'raylib' 'libx11' 'glibc' 'gcc-libs' 'libglvnd')
makedepends=('git' 'make' 'gcc')
source=("git+$url.git")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"

  install -Dm755 "da_browser_launcher" "$pkgdir/usr/bin/da-browser-launcher"

  install -dm755 "$pkgdir/usr/share/da-browser-launcher"

  if [ -d "assets" ]; then
    install -Dm644 assets/* -t "$pkgdir/usr/share/da-browser-launcher/"
  fi
}
