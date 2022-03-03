# Maintainer: Funami
pkgname=cargo-zigbuild-bin
pkgver=0.6.3
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
sha256sums_x86_64=('0d8467b86fdf23fafb8caa4da0d9a212841900e5470c85dce025ff4e470e1b9b')
sha256sums_i686=('fa1536fa35afa4d3a70c456f1ef5e0655e82729f1868a59601176c57f792b28b')
sha256sums_armv7h=('d4176245695de5b94a9556726376b2d2cd563ab2835b44895983b92e8eef6533')
sha256sums_aarch64=('258aa103a4d040558ecd4fcc7af6508bc29a1b6f79cec0a94f2e7f2d1404f3cf')

prepare() {
  mkdir -p "$pkgname-$pkgver-$CARCH"
  bsdtar -xf "$pkgname-$pkgver-$CARCH.tar.gz" -C "$pkgname-$pkgver-$CARCH"
}

package() {
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/cargo-zigbuild"
  
  cd "$pkgname-$pkgver-$CARCH"
  install -Dm755 cargo-zigbuild -t "$pkgdir/usr/bin"
}
