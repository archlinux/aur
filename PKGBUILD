#_gitauthor="tuxnix"
#_gitbranch="master"
# Maintainer: tuxnix <tuxnix@gmx.com>


pkgrel=1
pkgver=0.9.7
_name="ureminder"
pkgname="$_name"
pkgdesc='Reminds to upgrade Arch Linux by desktop-messages, shows Arch Linux News and keeps package mirrors and cache healthy'
url='https://codeberg.org/tuxnix/ureminder'
arch=('any')
license=('GLPv2-only')
depends=('curl' 'dunst' 'libnotify' 'reflector' 'pacman-contrib')
makedepends=('git')
source=('git+https://codeberg.org/tuxnix/ureminder' $_name.install)
sha512sums=('SKIP'
            '48a82d85b679abddb558eb1e303a0998cc6f6e61ae8ad667a73bae9fed6c0e529625dab0b37af7d4c3720888e368682e8912d185a3eb08ed0c252981b9241bec')
install="$_name.install"

package() {
    cd "$srcdir/$_name"
    install -Dm744 $_name "$pkgdir/usr/bin/$_name"
    install -Dm644 $_name.mo "$pkgdir/usr/share/locale/de_DE/LC_MESSAGES/$_name.mo"
    install -Dm644 $_name.config "$pkgdir/etc/$_name.config"
    install -Dm644 $_name.service "$pkgdir/usr/lib/systemd/system/$_name.service"
    install -Dm644 $_name.timer "$pkgdir/usr/lib/systemd/system/$_name.timer"
    install -Dm644 dunstrc "$pkgdir/usr/share/dunst/dunstrc"
    install -Dm644 dunstd.service "$pkgdir/etc/systemd/user/dunstd.service"
    install -Dm605 dunst.sh "$pkgdir/usr/bin/autostart/dunst.sh"
    install -Dm605 dunst.desktop "$pkgdir/etc/xdg/autostart/dunst.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}
