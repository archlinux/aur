# Maintainer: Asempere <asempere158@gmail.com>

pkgname=anicli-esp
pkgver=1.3.1
pkgrel=1
pkgdesc="Ver anime subtitulado en Español desde el terminal"
arch=('x86_64')
url="https://github.com/Asempere123123/anicli-esp"
license=('MIT')
depends=('mpv' 'yt-dlp' 'openssl')
makedepends=('cargo' 'gcc' 'binutils' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Asempere123123/$pkgname/archive/v$pkgver.tar.gz")

build() {
  cd "$pkgname-$pkgver"

  unset CFLAGS
  unset CXXFLAGS
  unset LDFLAGS
  export RUSTUP_TOOLCHAIN=stable

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/anicli-esp" "$pkgdir/usr/bin/anicli-esp"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
sha256sums=('40f2dc4789cf74f94d17bf6910f2d9ab0f90a49dc8e95214ab4bdce80e16d7ab')
