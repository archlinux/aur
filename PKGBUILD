# Maintainer: Juhani Numminen <juhaninumminen0@gmail.com>

pkgname=pegsolitaire
pkgver=0.3
pkgrel=1
pkgdesc='game for one player involving movement of pegs on a board'
arch=(x86_64)
url='https://github.com/jnumm/pegsolitaire'
license=(GPL)
depends=(gtk3)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jnumm/pegsolitaire/archive/v$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://github.com/jnumm/pegsolitaire/releases/download/v$pkgver/v$pkgver.tar.gz.asc")
md5sums=('f209d6ac2dd3a6d8e7e90d4dc6c883d3'
         'SKIP')
validpgpkeys=(0AF14FC9D1E57BB2C9D793DD80866B628FE313C6)

build() {
  cd "$pkgname-$pkgver"
  make prefix=/usr
}

package() {
  cd "$pkgname-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install
}
