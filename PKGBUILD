# Maintainer: Ivan Potiienko <contact@xxanqw.pp.ua>
pkgname=waypin
pkgver=0.1.7
pkgrel=1
pkgdesc="A clipboard viewer for Wayland/X11 with GTK3, written in Rust"
arch=('x86_64')
url="https://github.com/xxanqw/waypin"
license=('GPL3')
depends=('gtk3' 'gdk-pixbuf2' 'wl-clipboard')
makedepends=('cargo' 'git')
source=("git+https://github.com/xxanqw/waypin.git#branch=restoring")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  cargo build --release --locked --target-dir "$srcdir/target"
}

package() {
  cd "$pkgname"
  install -Dm755 "$srcdir/target/release/waypin" "$pkgdir/usr/bin/waypin"
}