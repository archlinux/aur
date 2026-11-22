# Maintainer: tak0dan
pkgname=sunshine-store
pkgver=0.4.1
pkgrel=1
pkgdesc="Microsoft-Store-style app shop for Arch: pacman, AUR, Flatpak, AppImage and Snap with an instant, always-available catalogue and related-software discovery"
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
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/tak0dan/sunshine-store/tar.gz/refs/tags/v$pkgver")
sha256sums=('002ea1e3a525278b429aa109e9d74667368456041ae929a86b24afccfeb0bba8')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
