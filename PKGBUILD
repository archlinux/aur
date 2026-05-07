# Maintainer: Gabriele <castielloangela512@gmail.com>
pkgname=apt-fake-ubuntu
pkgver=1.7
pkgrel=1
pkgdesc="Ubuntu's apt wrapper for Arch (v1.7 Legacy & GUI Edition)"
arch=('any')
url="https://aur.archlinux.org/packages/apt-fake-ubuntu"
license=('GPL3')
depends=('pacman' 'bash' 'g-helper' 'zenity')
# All files are local
source=('apt' 'apt-fake.desktop' 'apt-fake.png')
sha256sums=('9324c07fd7df14d76d7339d513bec9c8a0409457c77bd1594bfc37faa78cccca'
            '81b7e66f512f1fe7ac507462b138fb6291b0a3601e09a4d763949b1271014553'
            '2efa2b8821340fc09e7db18bc1a8285e110e0bbcef9795729cbabf11ad57f184')

package() {
  # 1. Binary script
  install -Dm755 "${srcdir}/apt" "${pkgdir}/usr/bin/apt"
  
  # 2. Your Punk Icon (apt-fake.png)
  install -Dm644 "${srcdir}/apt-fake.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/apt-fake.png"
  
  # 3. Menu Launcher
  install -Dm644 "${srcdir}/apt-fake.desktop" "${pkgdir}/usr/share/applications/apt-fake.desktop"
}
