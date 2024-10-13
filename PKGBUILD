# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: sunflsks <sudhip@nashi.us>

pkgname=libgeneral
pkgver=84
pkgrel=1
pkgdesc='Common library for tihmstar tools'
arch=('x86_64')
url="https://github.com/tihmstar/$pkgname"
license=('LGPL-2.1-only')
makedepends=('git')
source=("git+$url.git#tag=$pkgver")
sha256sums=('94576233e79e0bf8413dc562d05bc154b522462a106a76ce0f6f5dbf20c29499')

build() {
  cd "$pkgname"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/" install
}
