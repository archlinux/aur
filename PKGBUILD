# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: sunflsks <sudhip@nashi.us>

pkgname=libgeneral
pkgver=93
pkgrel=1
pkgdesc='Common library for tihmstar tools'
arch=('x86_64')
url="https://github.com/tihmstar/$pkgname"
license=('LGPL-2.1-only')
makedepends=('git')
source=("git+$url.git#tag=$pkgver")
sha256sums=('4f7e62795b3a954b8b6a5c3633ff3c570bad8af088af25b8aaf62d4d22a6a966')

build() {
  cd "$pkgname"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/" install
}
