# Maintainer: Anders <clauderarch@tutamail.com>
pkgname=kripton-qr-reader-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="A CLI tool for reading QR codes from images, with directory scanning and persistent settings. (Pre-compiled binary)"
arch=('x86_64')
url="https://github.com/clauderarch/kripton-qr-reader"
license=('GPL3')
depends=('libwebp')
# makedepends=('rust' 'git')

source=("https://github.com/clauderarch/kripton-qr-reader/releases/download/v${pkgver}/kripton-qr-reader-${pkgver}-bin.tar.gz" 
        "kripton-qr-reader.desktop"
        "kripton-qr-reader.png")
sha256sums=('253ab2cd6ea7a51c877f117a196694fa212ea2a6b3199d488267e41d1298a2ea'
            '9f932b4e9b00714e007aa2b23ab2db22fa7dd3b1ca71472542c78f465b035a4a'
            'ebb078dc1620b61ecb61c4f63419e4289d2852fa3da31800e39c133f676cc643')

package() {
  install -Dm755 "$srcdir/kripton-qr-reader" "$pkgdir/usr/bin/kripton-qr-reader"
  install -Dm644 "$srcdir/kripton-qr-reader.desktop" "$pkgdir/usr/share/applications/kripton-qr-reader.desktop"
  install -Dm644 "$srcdir/kripton-qr-reader.png" "$pkgdir/usr/share/pixmaps/kripton-qr-reader.png"
}
