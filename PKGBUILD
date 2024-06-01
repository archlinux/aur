# Maintainer: Paolo De Donato <dedonato 95 at hotmail dot it>

pkgname=hyprland-target
pkgver=1.0
pkgrel=1
pkgdesc="Systemd session target for Hyprland"
url='https://github.com/Loara/hyprland-target'
arch=(any)
license=('GPL-3.0-or-later')
depends=(systemd hyprland)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Loara/hyprland-target/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('0d7e78c1e55c999a31dd6e179752f79c0c769045cd93c8c86c74cbbfabf095ba10ee91b25d68f29241eeafadb89c8fc58790cfc71e9941b99dacad33af1efa8c')

package() {
    cd "$srcdir/hyprland-target-$pkgver/"
    install -T -Dm0644 "hyprland-session.target" "$pkgdir/usr/lib/systemd/user/hyprland-session.target"
    install -T -Dm0644 "hyprland-session.desktop" "$pkgdir/usr/share/wayland-sessions/hyprland-session.desktop"
    install -T -Dm0755 "Hyprland-target.sh" "$pkgdir/usr/bin/Hyprland-target.sh"
}
