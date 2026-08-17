# Maintainer: Asempere <asempere158@gmail.com>

pkgname=anicli-esp
pkgver=1.3.2
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
sha256sums=('20a268244c5ed2c0a5828755fde54fd30659b5a61b13757a5db09fc32af4f2f3')
