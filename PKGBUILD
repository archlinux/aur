# Maintainer: tak0dan
pkgname=sunshine-store
pkgver=0.3.1
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
sha256sums=('8d0c838f466dedb5d6e403cb64b63e8ca3db42bd4e5b170931b27e4b05305a2e')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
