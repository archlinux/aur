# Maintainer: x70b1
pkgname=('hyprland-plugin-borders-plus-plus' 'hyprland-plugin-csgo-vulkan-fix' 'hyprland-plugin-hyprbars' 'hyprland-plugin-hyprexpo' 'hyprland-plugin-hyprscrolling' 'hyprland-plugin-hyprtrails' 'hyprland-plugin-hyprwinwrap' 'hyprland-plugin-xtra-dispatchers')
pkgbase='hyprland-plugins'
pkgver='0.52.2'
pkgrel=1
pkgdesc='Official plugins for Hyprland'
arch=('x86_64')
url='https://github.com/hyprwm/hyprland-plugins'
license=('BSD')
depends=("hyprland=$pkgver")
makedepends=('git' 'hyprland')
source=("$pkgbase::git+https://github.com/hyprwm/hyprland-plugins.git#commit=8c1212e96b81aa5f11fe21ca27defa2aad5b3cf3")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgbase"

    for package in ${pkgname[@]}; do
        plugin=${package##hyprland-plugin-}

        make -C "$plugin" all
    done
}

package_hyprland-plugin-borders-plus-plus() {
    pkgdesc="A Hyprland plugin that adds one or two additional borders to your windows"

    cd "$srcdir/$pkgbase/borders-plus-plus"
    install -Dm755 borders-plus-plus.so "$pkgdir/usr/lib/libhyprbordersplusplus.so"
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/hyprland-plugin-borders-plus-plus/LICENSE"
}

package_hyprland-plugin-csgo-vulkan-fix() {
    pkgdesc="A Hyprland plugin that fixes custom resolutions on CS:GO with -vulkan"

    cd "$srcdir/$pkgbase/csgo-vulkan-fix"
    install -Dm755 csgo-vulkan-fix.so "$pkgdir/usr/lib/libhyprcsgo.so"
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/hyprland-plugin-csgo-vulkan-fix/LICENSE"
}

package_hyprland-plugin-hyprbars() {
    pkgdesc="A Hyprland plugin that adds simple title bars to windows"

    cd "$srcdir/$pkgbase/hyprbars"
    install -Dm755 hyprbars.so "$pkgdir/usr/lib/libhyprbars.so"
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/hyprland-plugin-hyprbars/LICENSE"
}

package_hyprland-plugin-hyprexpo() {
    pkgdesc="A Hyprland plugin that adds an expo-like workspace overview"

    cd "$srcdir/$pkgbase/hyprexpo"
    install -Dm755 hyprexpo.so "$pkgdir/usr/lib/libhyprexpo.so"
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/hyprland-plugin-hyprexpo/LICENSE"
}

package_hyprland-plugin-hyprscrolling() {
    pkgdesc="A Hyprland plugin that adds a scrolling layout"

    cd "$srcdir/$pkgbase/hyprscrolling"
    install -Dm755 hyprscrolling.so "$pkgdir/usr/lib/libhyprscrolling.so"
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/hyprland-plugin-hyprscrolling/LICENSE"
}

package_hyprland-plugin-hyprtrails() {
    pkgdesc="A Hyprland plugin that adds smooth trails behind moving windows"

    cd "$srcdir/$pkgbase/hyprtrails"
    install -Dm755 hyprtrails.so "$pkgdir/usr/lib/libhyprtrails.so"
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/hyprland-plugin-hyprtrails/LICENSE"
}

package_hyprland-plugin-hyprwinwrap() {
    pkgdesc="A Hyprland clone of xwinwrap that allows you to put any app as a wallpaper"

    cd "$srcdir/$pkgbase/hyprwinwrap"
    install -Dm755 hyprwinwrap.so "$pkgdir/usr/lib/libhyprwinwrap.so"
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/hyprland-plugin-hyprwinwrap/LICENSE"
}

package_hyprland-plugin-xtra-dispatchers() {
    pkgdesc="A Hyprland plugin that adds some additional dispatchers."

    cd "$srcdir/$pkgbase/xtra-dispatchers"
    install -Dm755 xtra-dispatchers.so "$pkgdir/usr/lib/libxtradispatchers.so"
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/hyprland-plugin-xtra-dispatchers/LICENSE"
}
