# Maintainer: tak0dan
pkgname=sunshine-store
pkgver=0.2.0
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
            'snapd: install Snap packages'
            'inter-font: interface font'
            'ttf-cormorant: heading font')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9f17c9249a63abfb5cd174729d28aea306cc227c2b41ef776a49b80879699d4f')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
