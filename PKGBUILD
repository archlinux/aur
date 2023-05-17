# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=rxxr2-git
pkgver=r34.0eea5e9
pkgrel=1
pkgdesc='regular expression static analyzer'
license=()
arch=('x86_64')
makedepends=('ocaml' 'opam')
source=("${pkgname}::git+https://github.com/superhuman/rxxr2.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}


build() {
  cd "${pkgname}/code"
  ./build.sh
}

package() {
  install -D "${pkgname}/code/scan.bin" "$pkgdir/usr/bin/rxxr2"
}
