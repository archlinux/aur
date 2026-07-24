# Contributor: James Bunton <jamesbunton@delx.net.au>
# Contributor: Bruno Carnazzi <bcarnazzi@gmail.com>
# Contributor: tee < teeaur at duck dot com >
pkgname=regionset
pkgver=0.2
pkgrel=4
pkgdesc="read/sets the region code of DVD drives"
arch=(x86_64)
url="https://linvdr.org/projects/regionset"
license=(GPL-2.0-or-later)
#source=(http://linvdr.org/download/regionset/$pkgname-$pkgver.tar.gz)
source=("https://web.archive.org/web/20160312114441/http://linvdr.org/download/regionset/regionset-$pkgver.tar.gz")
b2sums=('e96c014effa78d7c5f636d80edb7d74741107dd11728ca7f52c2d41919960986d37fd4245bb7975928605c6a06e7e2c31d050b847771e60af837e3f2286edb27')

build() {
  make -C "$pkgname-$pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 regionset "$pkgdir"/usr/bin/regionset
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
