# Maintainer: Jaka Polesnik <polesnik.jaka@gmail.com>
pkgname=portage-manifest
pkgver=1.0.0
pkgrel=1
pkgdesc="A unified package browser for Arch Linux - search official repos, AUR, and Flatpak with beautiful README rendering"
arch=('x86_64')
url="https://github.com/Pol-Jak-295/portage-manifest"
license=('CC-BY-NC')
depends=('fuse2' 'electron' 'pacman' 'yay' 'flatpak')  # fuse2 needed for AppImage
makedepends=()
source=("$pkgname-$pkgver.AppImage::https://github.com/Pol-Jak-295/portage-manifest/releases/download/v$pkgver/Portage.Manifest-$pkgver.AppImage"
        "$pkgname.desktop")
sha256sums=('SKIP'
            'SKIP')

package() {
  # Install AppImage
  install -dm755 "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/$pkgname-$pkgver.AppImage" "$pkgdir/usr/bin/$pkgname"
  
  # Install desktop file
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  
  # Optional: Install icon
  # install -Dm644 "$srcdir/icon.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
}
