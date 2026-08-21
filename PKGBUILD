# Maintainer: Dae Euhwa <daedaevibin@ik.me>

pkgname=ddsh-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Dynamic Discord Rich Presence based on active Hyprland windows"
arch=('x86_64')
url="https://github.com/Veridian-Zenith/DDS"
license=('MIT')
depends=('glibc')
provides=('ddsh')
conflicts=('ddsh' 'ddsh-git')
source=("$url/releases/download/v$pkgver/ddsh"
        "$url/raw/v$pkgver/scripts/discord-monitor.sh"
        "$url/raw/v$pkgver/scripts/discord-monitor-hyprland.service"
        "$url/raw/v$pkgver/common/src/config/default-config.json"
        "$url/raw/v$pkgver/LICENSE")
sha256sums=('23c0e47076ffbc5a09ffb5a4ed8decc0fdff3f69f53a4fc580228f4cfaf2c71e'
            'bd009eb28a8e0c26545fe2bf759a6c87e26fe723fd2405f8e20521b706c75a31'
            '3aae419a1c290d6ed31bca70f2112359d492fe9e81d9ffebc460824bfe26904a'
            'a3fd3088014dc63e38a92b390534f4196a03b1655bdd87e51f68e38fc535503d'
            '2b09f33eb7d5a8918fefa610b03fbf4abdbc5c072d16698f4221b49798183c51')

package() {
    install -Dm755 "$srcdir/ddsh" -t "$pkgdir/usr/bin/"
    install -Dm755 "$srcdir/discord-monitor.sh" "$pkgdir/usr/bin/discord-monitor-ddsh.sh"
    install -Dm644 "$srcdir/discord-monitor-hyprland.service" -t "$pkgdir/usr/lib/systemd/user/"
    install -Dm644 "$srcdir/default-config.json" "$pkgdir/usr/share/ddsh/config.json"
    install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
