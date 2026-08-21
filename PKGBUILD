# Maintainer: Dae Euhwa <daedaevibin@ik.me>

pkgname=ddsc-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Dynamic Discord Rich Presence based on active COSMIC windows"
arch=('x86_64')
url="https://github.com/Veridian-Zenith/DDS"
license=('MIT')
depends=('glibc')
provides=('ddsc')
conflicts=('ddsc' 'ddsc-git')
source=("$url/releases/download/v$pkgver/ddsc"
        "$url/raw/v$pkgver/scripts/discord-monitor.sh"
        "$url/raw/v$pkgver/scripts/discord-monitor-cosmic.service"
        "$url/raw/v$pkgver/common/src/config/default-config-cosmic.json"
        "$url/raw/v$pkgver/cosmic/autostart/ddsc.desktop"
        "$url/raw/v$pkgver/LICENSE")
sha256sums=('99e8fe794e3f50d43772927ee173b14e92f12d85db69ee033729a106aaa4fdc3'
            'bd009eb28a8e0c26545fe2bf759a6c87e26fe723fd2405f8e20521b706c75a31'
            'df1e9be7517b2b8fa4a6dbda394442aaeabfc4172cd6b8bd3ae3e849f2305ce1'
            'd247615508c3775e0a7344fa59d9977e2ad13069258fad5060feafbf084f3cfc'
            '6bd7c10894f764c065147fb2ab60eeca5b66eb9978e5bf3297297757e21d4c1b'
            '8403fb944ff1dd22b77466e452b807393834371a9deada0b62d281d8db62ec81')

package() {
    install -Dm755 "$srcdir/ddsc" -t "$pkgdir/usr/bin/"
    install -Dm755 "$srcdir/discord-monitor.sh" "$pkgdir/usr/bin/discord-monitor-ddsc.sh"
    install -Dm644 "$srcdir/discord-monitor-cosmic.service" -t "$pkgdir/usr/lib/systemd/user/"
    install -Dm644 "$srcdir/default-config-cosmic.json" "$pkgdir/usr/share/ddsc/config.json"
    install -Dm644 "$srcdir/ddsc.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
