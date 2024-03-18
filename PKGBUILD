# Maintainer: Obscurely <adrian.obscurely@protonmail.com>
pkgname=falion-bin
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="An open source, programmed in rust, privacy focused tool for scraping programming resources (like stackoverflow) fast, efficient and asynchronous/parallel using the CLI or GUI. "
arch=('x86_64')
url="https://github.com/Obscurely/falion"
license=('MIT')
provides=('falion-bin')
conflicts=('falion' 'falion-git')
source=("https://github.com/Obscurely/falion/releases/download/v${pkgver}-stable/falion-linux.tar.gz")
sha256sums=("ba2e17d397f2c29140d3f25f2e5ae51ed2686e2732d53349011a2bfb1ab25a5d")

package() {
    cd "$srcdir/"

    install -Dm755 falion -t "${pkgdir}/usr/bin/"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}/"
    install -Dm0644 -t "$pkgdir/usr/share/applications/" "linux/desktop/falion.desktop"
    for size in 16x16 32x32 64x64 128x128 256x256 512x512; do
      install -Dm0644 "linux/desktop/icons/hicolor/$size/apps/falion.png" \
        "$pkgdir/usr/share/icons/hicolor/$size/apps/falion.png"
    done
}
