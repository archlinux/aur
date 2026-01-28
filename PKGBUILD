# Maintainer: Mambuco <gabriele.giambrone@icloud.com>
pkgname=votetracker-bin
pkgver=2.7.0
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
sha256sums=('f44fc2877ab86cd0146861e46e716a983bdf7d1e5660b2722d750b6416e05a7a'
            '262673b7835ce28ad1d578b7ce971f2c968fca8a28da19e0383f9ff59cf54d4a')

package() {
    # Install binary
    install -Dm755 "$srcdir/VoteTracker-Linux-${pkgver}" "$pkgdir/usr/bin/votetracker"

    # Install .desktop file
    install -Dm644 "$srcdir/votetracker.desktop" "$pkgdir/usr/share/applications/votetracker.desktop"
}
