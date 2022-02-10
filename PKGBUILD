# Maintainer: Jagadeesh Kotra <jagadeesh at stdin dot top>

pkgname=wpc
pkgver=1.3.0
pkgrel=1
pkgdesc='Automatic Wallpaper Changer which can retrieve wallpapers from wallhaven, Bing and Reddit'
arch=('x86_64')
url='https://github.com/jkotra/wpc'
license=('MIT')
depends=('gnome-shell')
makedepends=('rust')
source=("https://github.com/jkotra/wpc/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a3afa040949d7afe3d28310dd0e9f37b3ee0ad1fbed03c280164625aaf82200a')

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --manifest-path $srcdir/$pkgname-$pkgver/Cargo.toml --release
}

package() {
  install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}

