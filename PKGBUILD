# Maintainer: tak0dan
pkgname=sunshine-store
pkgver=0.3.0
pkgrel=1
pkgdesc="Microsoft-Store-style app shop for Arch: pacman, AUR, Flatpak, AppImage and Snap with instant search"
arch=('any')
url="https://github.com/tak0dan/sunshine-store"
license=('GPL-3.0-or-later')
depends=('python' 'python-pyqt6' 'polkit' 'pacman')
optdepends=('libjxl: icons of repository apps'
            'qt6-imageformats: extra image formats'
            'archlinux-appstream-data: app names, icons and categories for repository packages'
            'yay: install AUR packages'
            'flatpak: install Flatpak apps'
            'wine: run Windows apps and games'
            'umu-launcher: run Windows games with Proton'
            'pacman-contrib: count of pending updates (checkupdates)'
            'icoutils: program icons for Windows apps'
            'snapd: install Snap packages'
            'inter-font: interface font'
            'ttf-cormorant: heading font')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('35f85484a0df051c7699658dc7e6cc46d8cac4dfac67b7673ea91ac494f5b70d')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
