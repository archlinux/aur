# Maintainer: Funami
pkgname=wasm-pack-bin
pkgver=0.10.2
pkgrel=1
pkgdesc="Your favorite rust -> wasm workflow tool!"
arch=('x86_64' 'aarch64')
url="https://github.com/rustwasm/wasm-pack"
license=('APACHE' 'MIT')
provides=('wasm-pack')
conflicts=('wasm-pack')
source_x86_64=("https://github.com/rustwasm/wasm-pack/releases/download/v$pkgver/wasm-pack-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/rustwasm/wasm-pack/releases/download/v$pkgver/wasm-pack-v$pkgver-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('ddf59a454fbee8712932803583d01756204c32fbfb13defa69f08c3e7afb6ac5')
sha256sums_aarch64=('3d693cb45dd242ab4bdb876ac151170d39edd7fb200383f2e40f890ca65c588e')

package() {
  cd "wasm-pack-v$pkgver-$CARCH-unknown-linux-musl"
  install -Dm755 wasm-pack -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/wasm-pack"
}
