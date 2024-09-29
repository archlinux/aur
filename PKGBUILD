# Maintainer: x70b1
pkgname=('hyprland-plugin-borders-plus-plus' 'hyprland-plugin-csgo-vulkan-fix' 'hyprland-plugin-hyprbars' 'hyprland-plugin-hyprexpo' 'hyprland-plugin-hyprtrails' 'hyprland-plugin-hyprwinwrap')
pkgbase=hyprland-plugins
pkgver=0.43.0
pkgrel=1
pkgdesc="Official plugins for Hyprland"
arch=(x86_64)
url="https://github.com/hyprwm/hyprland-plugins"
license=('BSD')
makedepends=(git hyprland)
source=("$pkgbase::git+https://github.com/hyprwm/hyprland-plugins.git#tag=v$pkgver")
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
    provides=(hyprland-plugin-borders-plus-plus)

    cd "$srcdir/$pkgbase/borders-plus-plus"
    install -Dm755 borders-plus-plus.so "$pkgdir/usr/lib/hyprland-plugins/borders-plus-plus.so"
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/hyprland-plugin-borders-plus-plus/LICENSE"
}

package_hyprland-plugin-csgo-vulkan-fix() {
    pkgdesc="A Hyprland plugin that fixes custom resolutions on CS:GO with -vulkan"
    provides=(hyprland-plugin-csgo-vulkan-fix)

    cd "$srcdir/$pkgbase/csgo-vulkan-fix"
    install -Dm755 csgo-vulkan-fix.so "$pkgdir/usr/lib/hyprland-plugins/csgo-vulkan-fix.so"
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/hyprland-plugin-csgo-vulkan-fix/LICENSE"
}

package_hyprland-plugin-hyprbars() {
    pkgdesc="A Hyprland plugin that adds simple title bars to windows"
    provides=(hyprland-plugin-hyprbars)

    cd "$srcdir/$pkgbase/hyprbars"
    install -Dm755 hyprbars.so "$pkgdir/usr/lib/hyprland-plugins/hyprbars.so"
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/hyprland-plugin-hyprbars/LICENSE"
}

package_hyprland-plugin-hyprexpo() {
    pkgdesc="A Hyprland plugin that adds an expo-like workspace overview"
    provides=(hyprland-plugin-hyprexpo)

    cd "$srcdir/$pkgbase/hyprexpo"
    install -Dm755 hyprexpo.so "$pkgdir/usr/lib/hyprland-plugins/hyprexpo.so"
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/hyprland-plugin-hyprexpo/LICENSE"
}

package_hyprland-plugin-hyprtrails() {
    pkgdesc="A Hyprland plugin that adds smooth trails behind moving windows"
    provides=(hyprland-plugin-hyprtrails)

    cd "$srcdir/$pkgbase/hyprtrails"
    install -Dm755 hyprtrails.so "$pkgdir/usr/lib/hyprland-plugins/hyprtrails.so"
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/hyprland-plugin-hyprtrails/LICENSE"
}

package_hyprland-plugin-hyprwinwrap() {
    pkgdesc="A Hyprland clone of xwinwrap that allows you to put any app as a wallpaper"
    provides=(hyprland-plugin-hyprwinwrap)

    cd "$srcdir/$pkgbase/hyprwinwrap"
    install -Dm755 hyprwinwrap.so "$pkgdir/usr/lib/hyprland-plugins/hyprwinwrap.so"
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/hyprland-plugin-hyprwinwrap/LICENSE"
}
