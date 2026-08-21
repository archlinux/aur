# Maintainer: Dae Euhwa <daedaevibin@ik.me>

pkgname=ddsn-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Dynamic Discord Rich Presence based on active Niri windows"
arch=('x86_64')
url="https://github.com/Veridian-Zenith/DDS"
license=('MIT')
depends=('glibc' 'niri')
provides=('ddsn')
conflicts=('ddsn' 'ddsn-git')
source=("$url/releases/download/v$pkgver/ddsn"
        "$url/raw/v$pkgver/scripts/discord-monitor.sh"
        "$url/raw/v$pkgver/scripts/discord-monitor-niri.service"
        "$url/raw/v$pkgver/common/src/config/default-config-niri.json"
        "$url/raw/v$pkgver/LICENSE")
sha256sums=('e5d2925c421e0a0d8e7c05dbf966e53fa22ba9ac1cf57ff1dda2be88e96ede7c'
            'bd009eb28a8e0c26545fe2bf759a6c87e26fe723fd2405f8e20521b706c75a31'
            '9ec33fa7244b1df6b995a1d85159c207373b391027a339f0afce7fe3d6b530f6'
            'f395f71ec616592d224eb85cdc676346e3c655d488bfb5a637ace66d908e10bb'
            '8e945a764f8cbb12c32187e0a30bbd350273f0cd2ff5f613008926c4fd5c2a8d')

package() {
    install -Dm755 "$srcdir/ddsn" -t "$pkgdir/usr/bin/"
    install -Dm755 "$srcdir/discord-monitor.sh" "$pkgdir/usr/bin/discord-monitor-ddsn.sh"
    install -Dm644 "$srcdir/discord-monitor-niri.service" -t "$pkgdir/usr/lib/systemd/user/"
    install -Dm644 "$srcdir/default-config-niri.json" "$pkgdir/usr/share/ddsn/config.json"
    install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
