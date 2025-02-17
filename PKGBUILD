# Maintainer: Your Name <claudemods101@gmail.com>
pkgname=apexbrowser
pkgver=1.0
pkgrel=1
pkgdesc="Super Fast Custom Lightweight Qt6 Browser Written in C++23"
arch=('x86_64')
url="https://github.com/claudemods/ApexBrowserAppImage"
license=('GPL')
depends=('qt6-base' 'qt6-webengine')  # Added qt6-webengine
makedepends=('git' 'make' 'gcc' 'qt6-tools')
source=("git+https://github.com/claudemods/ApexBrowserAppImage.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/ApexBrowserAppImage"
  qmake6 PREFIX=/usr
  make
}

package() {
  cd "$srcdir/ApexBrowserAppImage"

  # Install the binary to /usr/bin
  install -Dm755 "apexbrowser.bin" "$pkgdir/usr/bin/apexbrowser"

  # Install the .desktop file to /usr/share/applications
  install -Dm644 "apexbrowser.desktop" "$pkgdir/usr/share/applications/apexbrowser.desktop"

  # Install the custom icon to /usr/share/icons/hicolor/256x256/apps/
  install -Dm644 "apexbrowser.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/apexbrowser.png"
}
