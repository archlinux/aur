# Maintainer: gabrielearchapt <castielloangela512@gmail.com>
pkgname=apt-fake-ubuntu
pkgver=1.5
pkgrel=1
pkgdesc="Ubuntu's apt wrapper for Arch, features g-helper integration and custom icon"
arch=('any')
url="https://aur.archlinux.org/packages/apt-fake-ubuntu"
license=('GPL3')
depends=('pacman' 'bash' 'g-helper')
source=('apt' 'apt-fake.desktop' 'apt-fake.png')
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
  # 1. Install apt script
  install -Dm755 "${srcdir}/apt" "${pkgdir}/usr/bin/apt"
  
  # 2. Install the icon with Arch/Ubuntu logo
  install -Dm644 "${srcdir}/apt-fake.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/apt-fake.png"
  
  # 3. Installa the desktop icon for (XFCE/KDE Plasma/GNOME or a different WM or DE)
  install -Dm644 "${srcdir}/apt-fake.desktop" "${pkgdir}/usr/share/applications/apt-fake.desktop"
}
