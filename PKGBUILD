# Maintainer: Jagadeesh Kotra <jagadeesh at stdin dot top>

pkgname=wpc
pkgver=1.4.1
pkgrel=1
pkgdesc='Automatic Wallpaper Changer which can retrieve wallpapers from wallhaven, Bing and Reddit'
arch=('x86_64')
url='https://github.com/jkotra/wpc'
license=('MIT')
depends=('gnome-shell')
makedepends=('rust')
source=("https://github.com/jkotra/wpc/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ed874c0e27e65b9235ec894afa0e93d83d6fe159988201caa21616da759ed23f')

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --manifest-path $srcdir/$pkgname-$pkgver/Cargo.toml --release
}

package() {
  install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}

