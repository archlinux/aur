# Maintainer: Mambuco <gabriele.giambrone@icloud.com>
pkgname=votetracker-bin
pkgver=2.8.0
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
sha256sums=('f98524843fa43781c2f0deb20a5292cc53bcc4ccc2d44f6f3446e4b8c05070d4'
            '5839ccfa311dae0df31d59145935fb0454e1cefef18e5d36b1ce2fa322d0b2a5')

package() {
    # Install binary
    install -Dm755 "$srcdir/VoteTracker-Linux-${pkgver}" "$pkgdir/usr/bin/votetracker"

    # Install .desktop file
    install -Dm644 "$srcdir/votetracker.desktop" "$pkgdir/usr/share/applications/votetracker.desktop"
}
