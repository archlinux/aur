# Maintainer: Ekats <ekats@users.noreply.github.com>
pkgname=kitty-meow-config
pkgver=1.0.0
pkgrel=1
pkgdesc="Configuration files for kitty-meow: custom tab bar, persistent zoom, and theme"
arch=('any')
url="https://github.com/Ekats/kitty-meow"
license=('MIT')
depends=('bc')
optdepends=('kitty-meow-git: kitty fork with persistent selection')
install=kitty-meow-config.install
source=("tab_bar.py"
        "meow.conf"
        "current-theme.conf"
        "font_size.conf"
        "kitty-meow-setup"
        "kitty-meow-uninstall")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
    # Install config files to /usr/share
    install -Dm644 "$srcdir/tab_bar.py" "$pkgdir/usr/share/kitty-meow-config/tab_bar.py"
    install -Dm644 "$srcdir/meow.conf" "$pkgdir/usr/share/kitty-meow-config/meow.conf"
    install -Dm644 "$srcdir/current-theme.conf" "$pkgdir/usr/share/kitty-meow-config/current-theme.conf"
    install -Dm644 "$srcdir/font_size.conf" "$pkgdir/usr/share/kitty-meow-config/font_size.conf"

    # Install setup/uninstall scripts
    install -Dm755 "$srcdir/kitty-meow-setup" "$pkgdir/usr/bin/kitty-meow-setup"
    install -Dm755 "$srcdir/kitty-meow-uninstall" "$pkgdir/usr/bin/kitty-meow-uninstall"
}
