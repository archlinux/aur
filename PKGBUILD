# Maintainer: Goldy goldy@devgoldy.xyz

_pkgname=roseate
pkgname=roseate-bin
_pkgver="0.1.0-alpha.10"
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="🌹 A fancy yet simple image viewer — highly configurable, cross-platform, GPU-accelerated and fast as fu#k."
url="https://github.com/cloudy-org/roseate"
license=(GPL-3.0-only)
provides=("roseate")
conflicts=("roseate")
arch=("x86_64")
source=(
    "$_pkgname::https://github.com/cloudy-org/roseate/releases/download/$_pkgver/roseate-linux-x64"
    "roseate.png::https://raw.githubusercontent.com/cloudy-org/roseate/refs/heads/main/assets/rose_emojis/google_noto.png"
    "roseate.desktop::https://raw.githubusercontent.com/cloudy-org/roseate/refs/heads/main/assets/roseate.desktop"
)
sha256sums=(
    "SKIP" # doesn't exist yet
    "168c0217ee4dd6c6d9ddea1c3c3452df99a0bae16c7d97e85a34977e09556e60"
    "66917d0bf20f300ee88770cc0597f2cbfcd8b84688a3595f8066b1101fd8bc1c"
)

package() {
    cd $srcdir
    install -Dm755 roseate "$pkgdir/usr/bin/roseate"

    install -Dm644 roseate.desktop "$pkgdir/usr/share/applications/roseate.desktop"
    install -Dm644 roseate.png "$pkgdir/usr/share/pixmaps/roseate.png"
}