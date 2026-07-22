# Maintainer: Dae Euhwa <daedaevibin@ik.me>

pkgname=ddsh-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Dynamic Discord Rich Presence based on active Hyprland windows"
arch=('x86_64')
url="https://github.com/Veridian-Zenith/discord-dynamic-status-hyprland"
license=('MIT')
depends=('glibc')
provides=('ddsh')
conflicts=('ddsh' 'ddsh-git')
source=("$url/releases/download/v$pkgver/ddsh"
        "$url/raw/v$pkgver/scripts/discord-monitor.sh"
        "$url/raw/v$pkgver/scripts/discord-monitor-hyprland.service"
        "$url/raw/v$pkgver/LICENSE")
b2sums=('697fdf81f68cc20ae177653dddf5bca9b9ee466a8179f36dc399e7539a33d60ad13bbb1b9e8cf1efe9c6875b061bb803593f981c03db4fbac2a53914074d709b'
        '889e967a5c1385090528898d2eb0d7288ede982ca9a0a81b1e752673521e6811639add6d7e1d2b6bb782bf89d4043beec0f193ef2694d201c6e1a7e503ade045'
        '8a28faa7d4c908730cfc4a50d4e6d05eb93757de2814cb1c5d943fd7f99f6180d229957ca6bdf64b82be7c99287734611a93329c1b135b8a472fcae1476c93c6'
        '50c0cb9c952805d1c3873f6150a5c411ac00cbf180d80437761aa55058aa84cb7dad973b8d5b3005f33287474cc9dbd9691502c8944e76ce99b20399ef74df87')

package() {
    install -Dm755 "$srcdir/ddsh" -t "$pkgdir/usr/bin/"
    install -Dm755 "$srcdir/discord-monitor.sh" "$pkgdir/usr/bin/discord-monitor-ddsh.sh"
    install -Dm644 "$srcdir/discord-monitor-hyprland.service" -t "$pkgdir/usr/lib/systemd/user/"
    install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
