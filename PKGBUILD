# Maintainer: Łukasz Moroz <lukaszmoroz@gmail.com>

pkgname=gnome-shell-extension-current-screen-only-on-window-switcher-git
pkgver=r29.1ff6484
pkgrel=1
pkgdesc="Gnome shell extension that filters the windows shown in the window switcher to those of the current monitor"
arch=('any')
url="https://github.com/mmai/Current_screen_only_on_window_switcher"
license=('MIT')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/mmai/Current_screen_only_on_window_switcher.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    _uuid='Current_screen_only_for_Alternate_Tab@bourcereau.fr'
    install -Dm644 -t "$pkgdir/usr/share/gnome-shell/extensions/$_uuid" extension.js metadata.json
    install -Dm644 -t "$pkgdir/usr/share/licenses/${pkgname%-git}" LICENSE
}
