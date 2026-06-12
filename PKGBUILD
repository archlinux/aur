# Maintainer: Gudhal Chauhan <gudhalarya@gmail.com>
pkgname=powerguard
pkgver=1.1.0
pkgrel=1
pkgdesc="Power button confirmation dialog — prevents accidental shutdowns on Hyprland/Wayland/X11"
arch=('any')
url="https://github.com/gudhalarya/powerguard"
license=('MIT')
depends=('bash' 'systemd' 'acpid')
optdepends=(
    'wofi: dialog for Hyprland/Wayland (recommended)'
    'rofi: alternative dialog for Wayland/X11'
    'zenity: GTK dialog fallback'
    'whiptail: terminal fallback'
)
source=("powerguard::https://raw.githubusercontent.com/gudhalarya/powerguard/main/powerguard")
sha256sums=('95c77d72f85df3d44fcc54f6c80a0345e32190b75a9daacf36f1fd94f67191f0')

package() {
    install -Dm755 "$srcdir/powerguard" "$pkgdir/usr/local/bin/powerguard"
}

post_install() {
    echo ""
    echo "  Run setup with: sudo powerguard install"
    echo "  Need a dialog?  sudo pacman -S wofi"
    echo ""
}
