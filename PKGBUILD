# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_pkgname=libgeneral
pkgname=$_pkgname-git
pkgver=r26.4c96389
pkgrel=1
pkgdesc="General stuff for tihmstar's projects - git version"
arch=('x86_64')
url="https://github.com/tihmstar/$_pkgname"
license=('unknown')
makedepends=('git')
provides=('libgeneral')
conflicts=('libgeneral')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir/" install
}
