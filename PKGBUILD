# Maintainer: Funami
pkgname=cargo-zigbuild-bin
pkgver=0.5.4
pkgrel=1
pkgdesc="A cargo subcommand to compile Cargo projects with zig as linker"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/messense/cargo-zigbuild"
license=('MIT')
depends=('zig')
provides=('cargo-zigbuild')
conflicts=('cargo-zigbuild')
source=("https://raw.githubusercontent.com/messense/cargo-zigbuild/v$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/messense/cargo-zigbuild/releases/download/v$pkgver/cargo-zigbuild-v$pkgver.x86_64-unknown-linux-musl.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::https://github.com/messense/cargo-zigbuild/releases/download/v$pkgver/cargo-zigbuild-v$pkgver.i686-unknown-linux-musl.tar.gz")
source_armv7h=("$pkgname-$pkgver-armv7h.tar.gz::https://github.com/messense/cargo-zigbuild/releases/download/v$pkgver/cargo-zigbuild-v$pkgver.armv7-unknown-linux-musleabihf.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/messense/cargo-zigbuild/releases/download/v$pkgver/cargo-zigbuild-v$pkgver.aarch64-unknown-linux-musl.tar.gz")
noextract=("$pkgname-$pkgver-x86_64.tar.gz"
           "$pkgname-$pkgver-i686.tar.gz"
           "$pkgname-$pkgver-armv7h.tar.gz"
           "$pkgname-$pkgver-aarch64.tar.gz")
sha256sums=('74c4c1ce947760824daf396d972a613459c0a4e39d1e6b7c8768a5dc1ab860b8')
sha256sums_x86_64=('5ffc1c834379e530a3a37b79ed0468ad883880977ca365a7a41b1f17e8552573')
sha256sums_i686=('67bbe4aa85bc811810f657086b7afa8ee6b86b8c6c8147c8dc115feced97bdc8')
sha256sums_armv7h=('9e4c5b8e3e8d8db947cc3e6ec83a76740f6038dd5f0b4d955499d7d449913a2e')
sha256sums_aarch64=('9bca3d30b0bc999d92fce41e20826cba60a3adcf10c835c41e6ce27f6ae3e00f')

prepare() {
  mkdir -p "$pkgname-$pkgver-$CARCH"
  bsdtar -xf "$pkgname-$pkgver-$CARCH.tar.gz" -C "$pkgname-$pkgver-$CARCH"
}

package() {
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/cargo-zigbuild"
  
  cd "$pkgname-$pkgver-$CARCH"
  install -Dm755 cargo-zigbuild -t "$pkgdir/usr/bin"
}
