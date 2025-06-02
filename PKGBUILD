pkgname=hyprland-simple-setup
pkgver=0.3.2
pkgrel=1
pkgdesc="Minimalistic Hyprland setup"
arch=('any')
url="https://github.com/Firstp1ck/Hyprland_Simple_Setup"
license=('GPL3')
depends=(
  'git'
  'hyprland'
)
source=("$pkgname::git+https://github.com/Firstp1ck/Hyprland_Simple_Setup.git")
sha256sums=('SKIP')

package() {
  cd "$pkgname"
  
  # 1. Install all files to /usr/share/$pkgname (analog to git clone)
  install -dm755 "$pkgdir/usr/share/$pkgname"
  cp -a . "$pkgdir/usr/share/$pkgname/"
  
  # 2. Install main setup script (analog to ./setup.sh)
  install -Dm755 setup.sh "$pkgdir/usr/bin/hyprland-simple-setup"
}
post_install() {
  echo "==> Run 'hyprland-simple-setup' to complete the setup."
}

