# Maintainer: Your Name <claudemods101@gmail.com>
pkgname=apexinstaller
pkgver=1.0
pkgrel=1
pkgdesc="A Qt6-based Arch installer application"
arch=('x86_64')
url="https://github.com/claudemods/ApexArchInstallerAppImage"
license=('GPL')
depends=('qt6-base')
makedepends=('git' 'make' 'gcc' 'qt6-tools')
source=("git+https://github.com/claudemods/ApexArchInstallerAppImage.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/ApexArchInstallerAppImage"
  qmake6 PREFIX=/usr
  make
}

package() {
  cd "$srcdir/ApexArchInstallerAppImage"

  # Install the binary to /usr/bin
  install -Dm755 "ApexInstaller.bin" "$pkgdir/usr/bin/ApexInstaller"

  # Install the .desktop file to /usr/share/applications
  install -Dm644 "ApexInstaller.desktop" "$pkgdir/usr/share/applications/ApexInstaller.desktop"

  # Install the custom icon to /usr/share/icons/hicolor/256x256/apps/
  install -Dm644 "customdistro.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/customdistro.png"
}
