# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: sunflsks <sudhip@nashi.us>

pkgname=libfragmentzip
pkgver=77
pkgrel=1
pkgdesc='A library allowing to download single files from a remote zip archive'
arch=('x86_64')
url="https://github.com/tihmstar/$pkgname"
license=('LGPL-3.0-only')
depends=('curl' 'zlib')
makedepends=('git' 'libgeneral')
source=("git+$url.git#tag=$pkgver")
sha256sums=('840b7660b6438ee25bbd18e5bcbc8ada0dfae94bbfe8ea938b551eca7d0c4172')

build() {
  cd "$pkgname"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/" install
}
