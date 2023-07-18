# Maintainer : kdx <kikoodx@paranoici.org>

_pkgname=doq
pkgname="$_pkgname-git"
pkgver=r2.dd4a155
pkgrel=1
pkgdesc='Small tool for creating single-file html documents.'
arch=(x86_64)
url="https://github.com/rxi/$_pkgname"
license=('MIT')
conflicts=("$_pkgname")
provides=("$_pkgname")
makedepends=('git')
sha256sums=('SKIP')
source=("$_pkgname::git+$url")

pkgver() {
  cd "$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  ./build.sh
}

package() {
  cd "$_pkgname"
  install -Dm711 doq "$pkgdir/usr/bin/doq"
  install -Dm644 readme.md "$pkgdir/usr/share/licenses/$pkgname/readme.md"
}
