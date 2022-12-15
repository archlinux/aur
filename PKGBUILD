# Maintainer: Jagadeesh Kotra <jagadeesh at stdin dot top>

pkgname=wpc
pkgver=1.6.1
pkgrel=1
pkgdesc='Automatic Wallpaper Changer which can retrieve wallpapers from Wallhaven and Reddit'
arch=('x86_64')
url='https://github.com/jkotra/wpc'
license=('MIT')
depends=('gnome-shell')
makedepends=('rust')
source=("https://github.com/jkotra/wpc/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1dead6d52e0695080e99792f9d3915f93f2aceaeb72d2322a6f25d5d290dd3ab')

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --manifest-path $srcdir/$pkgname-$pkgver/Cargo.toml --release
}

package() {
  install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}

