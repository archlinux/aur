# Maintainer: Anders <clauderarch@tutamail.com>
pkgname=kripton-qr-reader
pkgver=0.1.5
pkgrel=1
pkgdesc="A CLI tool for reading QR codes from images, with directory scanning and persistent settings."
arch=('x86_64')
url="https://github.com/clauderarch/kripton-qr-reader"
license=('GPL3')
depends=('libwebp')
makedepends=('cargo' 'rust') 
source=("https://github.com/clauderarch/kripton-qr-reader/archive/456b9fb6343148d6c73a252fe40810c62162dc5b.tar.gz"
        "kripton-qr-reader.desktop"
        "kripton-qr-reader.png")
sha256sums=('2cb5ac497b64b219dfcd39492b586ab25490df1607c821feb1acd03f464de191'
            '9f932b4e9b00714e007aa2b23ab2db22fa7dd3b1ca71472542c78f465b035a4a'
            'ebb078dc1620b61ecb61c4f63419e4289d2852fa3da31800e39c133f676cc643')

_pkgname_dir="${pkgname}-456b9fb6343148d6c73a252fe40810c62162dc5b"

build() {
  cd "$srcdir/$_pkgname_dir"
  cargo build --release
}

package() {
  cd "$srcdir/$_pkgname_dir"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/kripton-qr-reader.desktop" "$pkgdir/usr/share/applications/kripton-qr-reader.desktop"
  install -Dm644 "$srcdir/kripton-qr-reader.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
