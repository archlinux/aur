# Maintainer: Paolo De Donato <dedonato 95 at hotmail dot it>

pkgname=hyprland-target
pkgver=1.1
pkgrel=1
pkgdesc="Systemd session target for Hyprland"
url='https://github.com/Loara/hyprland-target'
arch=(any)
license=('GPL-3.0-or-later')
depends=(systemd hyprland)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Loara/hyprland-target/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('e0a244d4feea7c0165d27833ace36318188fa3068cc46b2740eba0c635be2c018acd50b92ceef07596e8ee92631f97944011175c1015490b76bbcc4a16c58b6c')

package() {
    cd "$srcdir/hyprland-target-$pkgver/"
    install -T -Dm0644 "hyprland-session-pre.target" "$pkgdir/usr/lib/systemd/user/hyprland-session-pre.target"
    install -T -Dm0644 "hyprland-session.target" "$pkgdir/usr/lib/systemd/user/hyprland-session.target"
    install -T -Dm0644 "hyprland-session.desktop" "$pkgdir/usr/share/wayland-sessions/hyprland-session.desktop"
    install -T -Dm0755 "Hyprland-target.sh" "$pkgdir/usr/bin/Hyprland-target.sh"
}
