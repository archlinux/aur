pkgname=ziggy-git
pkgver=0
pkgrel=0
pkgdesc=" A data serialization language for expressing clear API messages, config files, etc. "
arch=("any")
license=('MIT')
url="https://github.com/kristoff-it/ziggy/tree/main"

source=("git+https://github.com/kristoff-it/ziggy.git")
sha256sums=('SKIP')

prepare() {
  if ! command -v zig >/dev/null; then
    echo "please install zig first!"
    exit 1
  fi
}

build() {
  cd "$srcdir/ziggy"
  echo "Building..."
  zig build --release=safe
}

package() {
  install -Dm755 $srcdir/ziggy/zig-out/bin/ziggy $pkgdir/usr/bin/ziggy
}
