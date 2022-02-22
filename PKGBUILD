# Maintainer: Funami
pkgname=cargo-zigbuild-bin
pkgver=0.5.3
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
sha256sums_x86_64=('e3fda89df721cdcdb33b24ef9bea6be93039ddba2228f3b64e68ac24b325bc8b')
sha256sums_i686=('f48d7a65d14f7c6fcaa478076f9f46a524267848761deb71347274b25bef347d')
sha256sums_armv7h=('22420d31074781b108f75fb0a562bf9ef51e9472c68f67e52b8f16b1326e3a8d')
sha256sums_aarch64=('2e6b966c7e5a35eb4c31c6c4eef15d3437e9bcd0c418fa7fb2c45c604f995ba9')

prepare() {
  mkdir -p "$pkgname-$pkgver-$CARCH"
  bsdtar -xf "$pkgname-$pkgver-$CARCH.tar.gz" -C "$pkgname-$pkgver-$CARCH"
}

package() {
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/cargo-zigbuild"
  
  cd "$pkgname-$pkgver-$CARCH"
  install -Dm755 cargo-zigbuild -t "$pkgdir/usr/bin"
}
