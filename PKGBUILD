# Maintainer: Mambuco <gabriele.giambrone@icloud.com>
pkgname=votetracker-bin
pkgver=2.8.2
pkgrel=1
pkgdesc="School grade management application (italian school system) (pre-built binary)"
arch=('x86_64')
url="https://github.com/mambucodev/votetracker"
license=('MIT')
depends=('hicolor-icon-theme')
provides=('votetracker')
conflicts=('votetracker')
_icon_base="https://raw.githubusercontent.com/mambucodev/votetracker/v${pkgver}/icons"
source=("VoteTracker-Linux-${pkgver}::https://github.com/mambucodev/votetracker/releases/download/v${pkgver}/VoteTracker-Linux"
        "votetracker.desktop::https://raw.githubusercontent.com/mambucodev/votetracker/v${pkgver}/scripts/votetracker.desktop"
        "icon-16.png::${_icon_base}/icon-16.png"
        "icon-24.png::${_icon_base}/icon-24.png"
        "icon-32.png::${_icon_base}/icon-32.png"
        "icon-48.png::${_icon_base}/icon-48.png"
        "icon-64.png::${_icon_base}/icon-64.png"
        "icon-128.png::${_icon_base}/icon-128.png"
        "icon-256.png::${_icon_base}/icon-256.png"
        "icon-512.png::${_icon_base}/icon-512.png")
sha256sums=('50e12207ce68c4440f0967e0dc9c9cccf4d22e0f5d8173a0d0cea5906ed68fc8'
            '5839ccfa311dae0df31d59145935fb0454e1cefef18e5d36b1ce2fa322d0b2a5'
            '945f4770522d41ad609f497b7673b6e3c9f2a3749a19b0d5e821ab7c7fe74b78'
            '0a7a56ccfe2fb8b5af1854368ebabe531eb07cb8bf8d43c3edf867637860e840'
            '2017e55dcecb9a79c286d2d411df8ca590c208ac1849ea7910309213ad96e086'
            '4e7f7728569b290bbcdd6459007bd31ae8f098a4c1ed00d0e6fdb7e21cf5e50a'
            '9fe782cec84d644a0355285606fae7cc137d6450dfc83c3351de597eb0e2c074'
            'eb6a2b809839d33422dad087bd2a88ff66d6688f12ce0a1d5e6b3052b826b612'
            '557bfe34e262ca63f5e3e70e6f4c0ea4d2a95da617333cb98c7a16080a63589b'
            '42caedebdfbe3089a834da6ef77b4c1c56fad39e62c2a62abe994776944f801b')

package() {
    # Install binary
    install -Dm755 "$srcdir/VoteTracker-Linux-${pkgver}" "$pkgdir/usr/bin/votetracker"

    # Install .desktop file
    install -Dm644 "$srcdir/votetracker.desktop" "$pkgdir/usr/share/applications/votetracker.desktop"

    # Install icons
    for size in 16 24 32 48 64 128 256 512; do
        install -Dm644 "$srcdir/icon-${size}.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/votetracker.png"
    done
}
