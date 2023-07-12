# Maintainer: Obscurely <adrian.obscurely@protonmail.com>
pkgname=tsfh-bin
pkgver=0.74.0
pkgrel=1
epoch=
pkgdesc="CHANGEME_DESC"
arch=('x86_64')
url="https://github.com/Obscurely/tsfh"
license=('MIT')
provides=('tsfh-bin')
conflicts=('tsfh' 'tsfh-git')
source=("https://github.com/Obscurely/tsfh/releases/download/v${pkgver}-stable/tsfh-linux.tar.gz")
sha256sums=("66fa1e51d25ad57a4b7cab5377d42251fcbabe2d4f39611d2db19402d8ad09fc")

package() {
    cd "$srcdir/"

    install -Dm755 tsfh -t "${pkgdir}/usr/bin/"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}/"
    install -Dm0644 -t "$pkgdir/usr/share/applications/" "linux/desktop/tsfh.desktop"
    for size in 16x16 32x32 64x64 128x128 256x256 512x512; do
      install -Dm0644 "linux/desktop/icons/hicolor/$size/apps/tsfh.png" \
        "$pkgdir/usr/share/icons/hicolor/$size/apps/tsfh.png"
    done
}
