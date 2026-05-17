pkgname=hyprland-dotfiles
pkgver=20260517
pkgrel=1
pkgdesc="Hyprland + Wayland configs (hypr, waybar, rofi, kitty)"
arch=('any')
url="https://example.com/youruser/hyprland-dotfiles"
license=('MIT')
depends=('hyprland' 'wayland')
optdepends=('waybar: status bar' 'rofi: application launcher' 'kitty: terminal')
backup=()
options=(!strip)
source=("hyprland-dotfiles-20260517.tar.gz")
sha256sums=('2bfd78963932beee8a5107b22eae59c7f47ace69d6468e1be7320574daf3b92a')

build() {
  return 0
}

package() {
  install -d "$pkgdir/usr/share/$pkgname"
  cp -a "$srcdir"/* "$pkgdir/usr/share/$pkgname/"

  # install helper script if provided in packaging/
  if [ -f "$srcdir/packaging/hyprland-dotfiles-install" ]; then
    install -Dm755 "$srcdir/packaging/hyprland-dotfiles-install" "$pkgdir/usr/bin/hyprland-dotfiles-install"
  fi
}
