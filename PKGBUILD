# Maintainer: Obscurely <adrian.obscurely@protonmail.com>
pkgname=estash-bin
pkgver=0.6.0
pkgrel=2
epoch=
pkgdesc="An open source, cross-platform, programmed in rust, encrypted digital vault (store files and text) with the capability to set a path and with the click of a button to copy the contents to that file."
arch=('x86_64')
url="https://github.com/Obscurely/EStash"
license=('GPL3')
provides=('estash-bin')
conflicts=('estash' 'estash-git')
source=("https://github.com/Obscurely/EStash/releases/download/v${pkgver}-stable/estash-linux.tar.gz")
sha256sums=("b82721cc793d7754505aedcde87507da6e7c87d916c7a9c25e2fc55ac4d6b872")

package() {
    cd "$srcdir/"

    install -Dm755 estash -t "${pkgdir}/usr/bin/"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}/"
    install -Dm0644 -t "$pkgdir/usr/share/applications/" "linux/desktop/EStash.desktop"
    for size in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
      install -Dm0644 "linux/desktop/icons/hicolor/$size/apps/estash.png" \
        "$pkgdir/usr/share/icons/hicolor/$size/apps/estash.png"
    done
}
