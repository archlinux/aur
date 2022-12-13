# Maintainer: Obscurely <adrian.obscurely@protonmail.com>
pkgname=estash-bin
pkgver=0.6.2
pkgrel=1
epoch=
pkgdesc="An open source, cross-platform, programmed in rust, encrypted digital vault (store files and text) with the capability to set a path and with the click of a button to copy the contents to that file."
arch=('x86_64')
url="https://github.com/Obscurely/EStash"
license=('GPL3')
provides=('estash-bin')
conflicts=('estash' 'estash-git')
source=("https://github.com/Obscurely/EStash/releases/download/v${pkgver}-stable/estash-linux.tar.gz")
sha256sums=("df0e21ff03e96bcc5d33f745ed6900abd1b2dfae8782de074b851635453f6d86")

package() {
    cd "$srcdir/"

    install -Dm755 estash -t "${pkgdir}/usr/bin/"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}/"
    install -Dm0644 -t "$pkgdir/usr/share/applications/" "linux/desktop/EStash.desktop"
    for size in 16x16 32x32 64x64 128x128 256x256 512x512; do
      install -Dm0644 "linux/desktop/icons/hicolor/$size/apps/estash.png" \
        "$pkgdir/usr/share/icons/hicolor/$size/apps/estash.png"
    done
}
