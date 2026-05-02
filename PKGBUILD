# Maintainer: Mulpin <mulpin@aur.archlinux.org>
pkgname=mutop
pkgver=0.2.0
pkgrel=1
pkgdesc="A beautiful orange-themed TUI process manager (btop alternative in Rust)"
arch=('x86_64' 'aarch64')
url="https://github.com/MulpinKR/mutop"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git')
provides=('mutop')
source=("mutop-$pkgver.tar.gz::https://github.com/MulpinKR/mutop/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "mutop-$pkgver"
  cargo build --release --locked
}

package() {
  cd "mutop-$pkgver"
  install -Dm755 "target/release/mutop" "$pkgdir/usr/bin/mutop"
  install -Dm644 "mutop.desktop" "$pkgdir/usr/share/applications/mutop.desktop"
}
