# Maintainer: Corey Mwamba <contact dot me at coreymwamba dot co dot uk>
pkgname=waybar-niri-taskbar
pkgver=0.3.0+niri.25.08
_pkgname="${pkgname/waybar-/}-${pkgver/+/-}"
pkgrel=1
pkgdesc="A simple taskbar for Niri, written in Rust: release version"
arch=('x86_64')
url="https://github.com/lawngnome/niri-taskbar"
license=('MIT')
depends=('niri' 'waybar' 'gtk3')
makedepends=('rust' 'cargo')
conflicts=('waybar-niri-taskbar-git')
source=("https://github.com/LawnGnome/${pkgname/waybar-/}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a493e70aec0c60ff4782a73f7c26ac8fb4cefb9c2c7ee1ef5f664a3911e54694')
build() {
  cd "$_pkgname"
  cargo build --release --locked
}

package() {
  cd "$_pkgname"
  install -Dm755 "$srcdir/$_pkgname/target/release/libniri_taskbar.so" "$pkgdir/usr/lib/waybar/libniri_taskbar.so"
}
