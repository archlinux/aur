# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: sunflsks <sudhip@nashi.us>

pkgname=libgeneral
pkgver=83
pkgrel=1
pkgdesc='Common library for tihmstar tools'
arch=('x86_64')
url="https://github.com/tihmstar/$pkgname"
license=('LGPL-2.1-only')
makedepends=('git')
source=("git+$url.git#tag=$pkgver")
sha256sums=('42500dae120cdf7576a61d21c82e602522b5b7745a2aa47045af1baa89f3ab96')

build() {
  cd "$pkgname"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/" install
}
