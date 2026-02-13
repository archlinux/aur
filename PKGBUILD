# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: sunflsks <sudhip@nashi.us>

pkgname=libgeneral
pkgver=90
pkgrel=1
pkgdesc='Common library for tihmstar tools'
arch=('x86_64')
url="https://github.com/tihmstar/$pkgname"
license=('LGPL-2.1-only')
makedepends=('git')
source=("git+$url.git#tag=$pkgver")
sha256sums=('39e86db83bbc8516497c3f59298af51819ce06c2b1f7ccfdbea44f6c2f73278b')

build() {
  cd "$pkgname"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/" install
}
