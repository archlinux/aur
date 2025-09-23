# Maintainer: Satakun Utama <linesofcodes at dailitation dot xyz>

pkgname=vencoder-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A graphical tool to transcode video"
arch=("x86_64" "armv7h" "aarch64")
url=https://gitskette.dailitation.xyz/linesofcodes/vencoder
license=("GPL-3.0-or-later")
depends=("ffmpeg" "gtk3")
source=("https://gitskette.dailitation.xyz/linesofcodes/vencoder/releases/download/${pkgver}/vencoder-release.zip")
b2sums=("360e7a02ac37dc0fe01d78eb079cfb9665a97299ccc846c7facc58e4e4c22685f571582f0234d4b641542d55902e8ebb5eaba47c896848c3a97cbe717eff486c")

_dest="/opt/vencoder-bin"

package() {
    install -d "$pkgdir/$_dest"

    if [ "${CARCH}" = "aarch64" ]; then
        install "$srcdir/vencoder-linux_arm64" "$pkgdir/$_dest"
    elif [ "${CARCH}" = "i686" ]; then
        install "$srcdir/vencoder-linux_armhf" "$pkgdir/$_dest"
    else
        install "$srcdir/vencoder-linux_x64" "$pkgdir/$_dest"
    fi

    install "$srcdir/resources.neu" "$pkgdir/$_dest"
}
