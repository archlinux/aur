# Maintainer: Jagadeesh Kotra <jagadeesh at stdin dot top>

pkgname=wpc
pkgver=1.8.0
pkgrel=1
pkgdesc='Automatic Wallpaper Changer which can retrieve wallpapers from Wallhaven and Reddit'
arch=('x86_64')
url='https://github.com/jkotra/wpc'
license=('MIT')
depends=('gnome-shell')
makedepends=('rust')
source=("https://github.com/jkotra/wpc/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('939facb9c92d757e10b386ba0e5ff42d9ba0d8709228cfc6337e7735101bbd41')

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --manifest-path $srcdir/$pkgname-$pkgver/Cargo.toml --release
}

package() {
  install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}

