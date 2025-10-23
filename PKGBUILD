# Maintainer: Anders <clauderarch@tutamail.com>
pkgname=kripton-qr-reader
pkgver=0.1.6
pkgrel=1
pkgdesc="A CLI tool for reading QR codes from images, with directory scanning and persistent settings."
arch=('x86_64')
url="https://github.com/clauderarch/kripton-qr-reader"
license=('GPL3')
depends=('libwebp')
makedepends=('cargo' 'rust') 
source=("https://github.com/clauderarch/kripton-qr-reader/archive/e22f0970b05652e6389d61852d7ad8ccbd0acc1c.tar.gz"
        "kripton-qr-reader.desktop"
        "kripton-qr-reader.png")
sha256sums=('e2e36ff41b09d79c77d7b17ef328a10ff233a14dbed519edb47ec679acfa494f'
            '9f932b4e9b00714e007aa2b23ab2db22fa7dd3b1ca71472542c78f465b035a4a'
            'ebb078dc1620b61ecb61c4f63419e4289d2852fa3da31800e39c133f676cc643')

_pkgname_dir="${pkgname}-e22f0970b05652e6389d61852d7ad8ccbd0acc1c"

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
