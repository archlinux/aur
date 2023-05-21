# Maintainer: Leonardo Riether <riether.leonardo@gmail.com>

pkgname=tori-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="The frictionless music player for the terminal"
url="https://github.com/LeoRiether/tori"
license=("GPL-3.0-or-later")
arch=("x86_64")
provides=("tori")
conflicts=("tori")
depends=("mpv" "pipewire")
optdepends=("yt-dlp" "cava")
source=("https://github.com/LeoRiether/tori/releases/download/v$pkgver/tori-$pkgver-x86_64.tar.gz")
sha256sums=('242c6bc092169cac1b5db0fcd78d65c0be85edf34591d91f7188dcb11ccc64ff')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    install -Dm755 tori -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 tori.desktop "$pkgdir/usr/share/applications/tori.desktop"
    install -Dm644 tori.svg "$pkgdir/usr/share/pixmaps/"
}
