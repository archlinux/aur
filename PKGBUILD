# Maintainer: Mambuco <gabriele.giambrone@icloud.com>
pkgname=votetracker-bin
pkgver=2.7.1
pkgrel=1
pkgdesc="School grade management application (italian school system) (pre-built binary)"
arch=('x86_64')
url="https://github.com/mambucodev/votetracker"
license=('MIT')
depends=('hicolor-icon-theme')
provides=('votetracker')
conflicts=('votetracker')
source=("VoteTracker-Linux-${pkgver}::https://github.com/mambucodev/votetracker/releases/download/v${pkgver}/VoteTracker-Linux"
        "votetracker.desktop::https://raw.githubusercontent.com/mambucodev/votetracker/v${pkgver}/scripts/votetracker.desktop")
sha256sums=('d0d37ab7e895a4014564e04c30cd26f11d193f88ced5ca25899e2a7dffc42fe9'
            '262673b7835ce28ad1d578b7ce971f2c968fca8a28da19e0383f9ff59cf54d4a')

package() {
    # Install binary
    install -Dm755 "$srcdir/VoteTracker-Linux-${pkgver}" "$pkgdir/usr/bin/votetracker"

    # Install .desktop file
    install -Dm644 "$srcdir/votetracker.desktop" "$pkgdir/usr/share/applications/votetracker.desktop"
}
