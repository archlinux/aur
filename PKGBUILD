# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: sunflsks <sudhip@nashi.us>

pkgname=libgeneral
pkgver=92
pkgrel=1
pkgdesc='Common library for tihmstar tools'
arch=('x86_64')
url="https://github.com/tihmstar/$pkgname"
license=('LGPL-2.1-only')
makedepends=('git')
source=("git+$url.git#tag=$pkgver")
sha256sums=('8d3c8b4fcaee2d997469dfc2412701217bac6f04d402939bda4fba80dd8e5574')

build() {
  cd "$pkgname"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/" install
}
