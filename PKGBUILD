pkgname=zenith-git
pkgver=r174.cbe523d
pkgrel=1
pkgdesc='In terminal graphical metrics for your *nix system written in Rust'
arch=('x86_64')
url='https://github.com/bvaisvil/zenith'
license=('MIT')
depends=()
makedepends=('rust')

source=("git+https://github.com/bvaisvil/zenith.git")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  cargo build --release
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 "target/release/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
}