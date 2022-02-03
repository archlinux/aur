# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=lightctl
pkgver=r33.e476d0d
pkgrel=1
pkgdesc="backlight control utility that does smooth transitions"
url="https://git.sr.ht/~whynothugo/lightctl"
license=("ISC")
arch=("x86_64" "aarch64")
makedepends=("git" "rust")
source=("git+https://git.sr.ht/~whynothugo/lightctl")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"

  export RUSTUP_TOOLCHAIN=stable
  cargo install --no-track --locked --all-features --root "$pkgdir/usr/" --path .
}
