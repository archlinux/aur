# Maintainer: Unmellow <name2020@googlemail.commerce>
_pkgname=asuka
pkgname=asuka-git
pkgver=r47.1c6d9ad
pkgrel=1
pkgdesc="a Gemini Project client written in Rust with NCurses."
arch=("x86_64" "i686")
url="https://git.sr.ht/~julienxx/asuka"
license=('MIT')
depends=('ncurses' 'openssl')
makedepends=('git' 'rust')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://git.sr.ht/~julienxx/asuka')
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  cargo build --release
}

package() {
  cd $_pkgname
  mkdir -p "$pkgdir"/usr/bin
  mv ./target/release/asuka "$pkgdir"/usr/bin/
}
