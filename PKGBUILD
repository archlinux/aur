# Maintainer: Asempere <asempere158@gmail.com>

pkgname=anicli-esp
pkgver=1.2.0
pkgrel=1
pkgdesc="Ver anime subtitulado en Español desde el terminal"
arch=('x86_64')
url="https://github.com/Asempere123123/anicli-esp"
license=('MIT')
depends=('mpv' 'yt-dlp')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Asempere123123/$pkgname/archive/v$pkgver.tar.gz")

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/anicli-esp" "$pkgdir/usr/bin/anicli-esp"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
sha256sums=('4637ae61cf86c4e48b56ae204bb205f6c1a70b0fb62603a86b8eb02211be6112')
