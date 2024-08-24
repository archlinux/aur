# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: sunflsks <sudhip@nashi.us>

pkgname=libfragmentzip
pkgver=76
pkgrel=1
pkgdesc='A library allowing to download single files from a remote zip archive'
arch=('x86_64')
url="https://github.com/tihmstar/$pkgname"
license=('LGPL-3.0-only')
depends=('curl' 'zlib')
makedepends=('git' 'libgeneral')
source=("git+$url.git#tag=$pkgver")
sha256sums=('05b298c2e6d0f505dde8c411a1aa35ff6e9eef8d8cd74c00e1cbbd12000c9054')

build() {
  cd "$pkgname"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/" install
}
