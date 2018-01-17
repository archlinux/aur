# Maintainer: Juhani Numminen <juhaninumminen0@gmail.com>

pkgname=pegsolitaire
pkgver=0.1.1
pkgrel=1
pkgdesc='game for one player involving movement of pegs on a board'
arch=(i686 x86_64)
url='https://github.com/jnumm/pegsolitaire'
license=(GPL)
depends=(gtk2)
makedepends=(autoconf-archive)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jnumm/pegsolitaire/archive/v$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://github.com/jnumm/pegsolitaire/releases/download/v$pkgver/v$pkgver.tar.gz.asc")
md5sums=('f70d22e9b048db2f912d335d15e945d9'
         'SKIP')
validpgpkeys=(0AF14FC9D1E57BB2C9D793DD80866B628FE313C6)

prepare() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
