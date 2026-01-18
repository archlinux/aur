# Maintainer: C.H.Perlin <caiohperlin@gmail.com>

pkgname=tui-chan-git
pkgver=0.5.1.r0.g8f6ce4b
pkgrel=1
pkgdesc="An Imageboard Terminal User Interface. Currently supports only 4chan"
arch=('x86_64')
url="https://github.com/tuqqu/tui-chan"
license=('MIT')
makedepends=('git' 'rust')
provides=('tui-chan')
conflicts=('tui-chan')
source=("git+$url.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/tui-chan"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/tui-chan"
  cargo build --release
}

package() {
  cd "$srcdir/tui-chan"
  install -Dm755 target/release/tui-chan "$pkgdir/usr/bin/tui-chan"
}
