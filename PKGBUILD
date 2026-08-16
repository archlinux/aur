# Maintainer: Daniel Yuri <gratzyuri@gmail.com>

pkgname=pkg-notify
pkgver=1.1.0
pkgrel=1
pkgdesc="Lightweight Arch Linux package update checker with KDE Plasma notifications"
arch=('any')
url="https://github.com/gratzyuri-glitch/pkg-notify"
license=('MIT')

depends=(
    'bash'
    'coreutils'
    'gawk'
    'libnotify'
    'pacman-contrib'
    'util-linux'
)

optdepends=(
    'paru: AUR package update checking'
    'yay: AUR package update checking'
)

source=(
    "pkg-notify-${pkgver}.tar.gz::https://github.com/gratzyuri-glitch/pkg-notify/archive/v${pkgver}.tar.gz"
)

sha256sums=(
    'eedb81e831342dbe34f65020688bcb122b06758f7830d5f5bdbe8fac67f62bf5'
)

package() {
    cd "$srcdir/pkg-notify-$pkgver"

    install -Dm755 pkg-notify.sh \
        "$pkgdir/usr/bin/pkg-notify"

    install -Dm644 pkg-notify.service \
        "$pkgdir/usr/lib/systemd/user/pkg-notify.service"

    install -Dm644 pkg-notify.timer \
        "$pkgdir/usr/lib/systemd/user/pkg-notify.timer"

    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/pkg-notify/README.md"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/pkg-notify/LICENSE"
}
