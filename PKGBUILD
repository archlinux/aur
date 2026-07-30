# Maintainer: Goldy goldy@devgoldy.xyz

_pkgname=roseate
pkgname=roseate-bin
_pkgver="0.1.0-alpha.25"
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="🌹 A fancy yet simple image viewer — highly configurable, cross-platform, GPU-accelerated and fast."
url="https://github.com/cloudy-org/roseate"
license=(GPL-3.0-only)
depends=("libxcb" "libxkbcommon" "openssl" "libxrandr" "gcc-libs" "glibc")
arch=("x86_64")
source=(
    "$_pkgname::https://github.com/cloudy-org/roseate/releases/download/v$_pkgver/roseate-linux-x86_64"
    "roseate.png::https://github.com/cloudy-org/roseate/blob/main/app/assets/rose_emojis/google_noto.png?raw=true"
    "roseate.desktop::https://raw.githubusercontent.com/cloudy-org/roseate/refs/heads/main/app/assets/roseate.desktop"
)
sha256sums=(
    "fe9aa7a3cf8a5b7a27222d1762a8d80bb60556a756e07953a65f6bd1a26d4bd9"
    "168c0217ee4dd6c6d9ddea1c3c3452df99a0bae16c7d97e85a34977e09556e60"
    "57a9032ebf10256982c231cc0af80f6909dc6eabace0253270ec698e2a8dd80f"
)
provides=("roseate")
conflicts=("roseate")

package() {
    cd $srcdir
    install -Dm755 roseate "$pkgdir/usr/bin/roseate"

    install -Dm644 roseate.desktop "$pkgdir/usr/share/applications/roseate.desktop"
    install -Dm644 roseate.png "$pkgdir/usr/share/pixmaps/roseate.png"
}