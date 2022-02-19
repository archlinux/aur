# Maintainer: Funami
pkgname=cargo-zigbuild-bin
pkgver=0.4.3
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
sha256sums_x86_64=('b9acacc2214c11f1dd38c811ca515e96005eb9e46a43df46d21dff273cc376ce')
sha256sums_i686=('91bc75dabca45e9ffcaa51f6ce6e91a7f29332cd950166748a693f7473a5887a')
sha256sums_armv7h=('08e1345a382fc1bf7fef398ca6e573e81bfd11d4e73d1c2319a6f3776c530afe')
sha256sums_aarch64=('f687c24c7cec48afbca6d81b5cab5f8e6fb86ab4fd154451888db3a01712ab22')

prepare() {
  mkdir -p "$pkgname-$pkgver-$CARCH"
  bsdtar -xf "$pkgname-$pkgver-$CARCH.tar.gz" -C "$pkgname-$pkgver-$CARCH"
}

package() {
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/cargo-zigbuild"
  
  cd "$pkgname-$pkgver-$CARCH"
  install -Dm755 cargo-zigbuild -t "$pkgdir/usr/bin"
}
