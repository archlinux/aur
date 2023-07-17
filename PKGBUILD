# shellcheck shell=bash disable=SC2034,SC2154
pkgname=tellenc-git
pkgver=r35.dac04c7
pkgrel=1
pkgdesc="A program to detect the encoding of a text file."
arch=(x86_64)
url=https://github.com/adah1972/tellenc
license=(Unlicense)
source=("git+$url")
sha256sums=(SKIP)

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  g++ $pkgname.cpp -o$pkgname
  install -D "$pkgname" -t "$pkgdir/usr/bin"
}
