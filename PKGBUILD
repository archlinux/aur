# Maintainer: Mocha Hois <Mochaaaaaa@cybertari.net>
pkgname=waylandcraft-session-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Minimal labwc session preconfigured to run Minecraft Waylandcraft as a session."
arch=('x86_64')
url="https://github.com/NerdPupX3/Waylandcraft-Session"
license=('GPL-3.0-or-later')
depends=('labwc' 'prismlauncher' 'wlcontrol' 'pavucontrol')
source=("git+https://github.com/NerdPupX3/Waylandcraft-Session.git")
sha256sums=('SKIP')
package() {
    install -Dm644 "$srcdir/Waylandcraft-Session/config/rc.xml" \
        "$pkgdir/usr/share/waylandcraft/rc.xml"
    install -Dm755 "$srcdir/Waylandcraft-Session/scripts/start-waylandcraft.sh" \
        "$pkgdir/usr/bin/start-waylandcraft.sh"
    install -Dm644 "$srcdir/Waylandcraft-Session/waylandcraft-session.desktop" \
        "$pkgdir/usr/share/wayland-sessions/waylandcraft-session.desktop"
    install -Dm755 "$srcdir/Waylandcraft-Session/scripts/waylandcraft-setup.sh" \
        "$pkgdir/etc/profile.d/waylandcraft-setup.sh"
    install -dm755 "$srcdir/Waylandcraft-Session/instances" \
        "$pkgdir/usr/share/waylandcraft/instances"
    cp -a "$srcdir/Waylandcraft-Session/instances/(DO NOT DELETE) Waylandcraft Extended" \
        "$pkgdir/usr/share/waylandcraft/instances/"
    cp -a "$srcdir/Waylandcraft-Session/instances/(DO NOT DELETE) Waylandcraft original" \
        "$pkgdir/usr/share/waylandcraft/instances/"
}