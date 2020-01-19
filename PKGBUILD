# Maintanier: graysky <graysky AT archlinux dot us>
pkgname=kodi-logger
pkgver=1.9
pkgrel=1
pkgdesc='Keeps track of every video you watch on kodi.'
arch=('any')
license=('MIT')
url="https://github.com/graysky2/kodi-logger"
depends=('diffutils')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5d191ee06ce15ec86361d333326db5300bc9b675659919d9c89cb0185673cd04')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
