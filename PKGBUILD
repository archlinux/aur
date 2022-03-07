# Maintainer: Funami
pkgname=cargo-zigbuild-bin
pkgver=0.6.4
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
sha256sums_x86_64=('75cec8eb5b7a26533616409e43251a6de80f527a02ff6a6c7cddffa791482b28')
sha256sums_i686=('fe518d2a9406ac755cde1f0ece726982fce59909f996f3b26de298693d85b8cb')
sha256sums_armv7h=('ef8ff1f580896e758195af3e6af54565379a76ae70aa62265ed72eacaef34fb9')
sha256sums_aarch64=('5fa1d338d6461dad84fcfe9b8187a8347c6723b54a635baded232f65c9b49f25')

prepare() {
  mkdir -p "$pkgname-$pkgver-$CARCH"
  bsdtar -xf "$pkgname-$pkgver-$CARCH.tar.gz" -C "$pkgname-$pkgver-$CARCH"
}

package() {
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/cargo-zigbuild"
  
  cd "$pkgname-$pkgver-$CARCH"
  install -Dm755 cargo-zigbuild -t "$pkgdir/usr/bin"
}
