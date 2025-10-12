#_gitauthor="tuxnix"
#_gitbranch="master"
# Maintainer: tuxnix <tuxnix@gmx.com>

pkgrel=4
pkgver=0.1
_name="tuxnix-sway"
pkgname="$_name"
pkgdesc='Sway configuration of tuxnix'
url='https://codeberg.org/tuxnix/tuxnix-sway'
arch=('any')
license=('GLPv2-only')
depends=('alacritty' 'bemenu' 'foot' 'htop' 'kdialog' 'sway' 'otf-font-awesome' 'qt6ct' 'waybar')
makedepends=('git')
source=('git+https://codeberg.org/tuxnix/tuxnix-sway')
sha512sums=('SKIP')

package() {
    cd "$srcdir/$_name"
    install -Dm644 sway-desktop.config "$pkgdir/etc/skel/.config/sway-desktop/config"
    install -Dm644 sway-ardour.config "$pkgdir/etc/skel/.config/sway-ardour/config"
    install -Dm644 waybar.config "$pkgdir/etc/skel/.config/waybar/config"
    install -Dm644 style.css "$pkgdir/etc/skel/.config/waybar/style.css"
    install -Dm605 keybindings-md.sh "$pkgdir/usr/local/bin/keys-md"
    install -Dm605 keybindings-html.sh "$pkgdir/usr/local/bin/keys-html"
    install -Dm605 sway-switch "$pkgdir/usr/local/bin/sway-switch"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
