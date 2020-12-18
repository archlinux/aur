# Maintainer: Thayne McCombs <astrothayne at gmail dot com>
pkgname=wev
pkgver=1.0.0
pkgrel=4
pkgdesc="tool for debugging wayland events, similar to xev"
url='https://git.sr.ht/~sircmpwn/wev'
license=(MIT)
arch=('i686' 'x86_64')
depends=('wayland' 'wayland-protocols' 'libxkbcommon')
makedepends=('scdoc')
conflicts=('wev-git')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/wev/archive/$pkgver.tar.gz")
md5sums=('202208092a6560b1a78c568996a4cf27')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX=/usr MANDIR=/usr/share/man install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
