# Maintainer: Asempere <asempere158@gmail.com>

pkgname=anicli-esp
pkgver=main
pkgrel=1
pkgdesc="Ver anime subtitulado en Español desde el terminal"
arch=('x86_64')
url="https://github.com/Asempere123123/anicli-esp"
license=('MIT')
depends=('mpv' 'yt-dlp')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Asempere123123/$pkgname/archive/$pkgver.tar.gz")

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
sha256sums=('ac3e2bee5579208b68d8e53450e17d4350f40617fd5d351d1c6e58eb68659c0e')
