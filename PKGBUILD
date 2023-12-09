# Maintainer: Jagadeesh Kotra <jagadeesh at stdin dot top>

pkgname=wpc
pkgver=1.9.0
pkgrel=1
pkgdesc='Automatic Wallpaper Changer which can retrieve wallpapers from Wallhaven and Reddit'
arch=('x86_64')
url='https://github.com/jkotra/wpc'
license=('MIT')
depends=('gnome-shell')
makedepends=('rust')
source=("https://github.com/jkotra/wpc/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('fd9b0546305f129f3c2452742489600feffba717c4d2273961c7270565ed766f')

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --manifest-path $srcdir/$pkgname-$pkgver/Cargo.toml --release
}

package() {
  install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}

