# Maintainer: Your Name <claudemods101@gmail.com>
pkgname=claudemods-apu
pkgver=1.0
pkgrel=1
pkgdesc="claudemods arch package utility extra functions for pacman packages"
arch=('x86_64')
url="https://github.com/claudemods/claudemods-apu"
license=('GPL')
depends=()
makedepends=('git' 'make' 'gcc' 'qt6-tools')
source=("git+https://github.com/claudemods/claudemods-apu.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/claudemods-apu"
  qmake6 PREFIX=/usr
  make
}

package() {
  cd "$srcdir/claudemods-apu"

  # Install the binary to /usr/bin
  install -Dm755 "claudemods-apu.bin" "$pkgdir/usr/bin/claudemods-apu"

  # Install the .desktop file to /usr/share/applications
  install -Dm644 "claudemods-apu.desktop" "$pkgdir/usr/share/applications/claudemods-apu.desktop"

  # Install the custom icon to /usr/share/icons/hicolor/256x256/apps/
  install -Dm644 "claudemods-apu.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/claudemods-apu.png"
}
