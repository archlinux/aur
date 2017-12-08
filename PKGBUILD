# Maintainer: Tobias Brox <t-arch@tobixen.no>
pkgname=thrash-protect
pkgver=0.11.6
pkgrel=2
pkgdesc="Simple-Stupid user-space program protecting a linux host from thrashing."
url="https://github.com/tobixen/thrash-protect"
arch=('any')
license=('GPL')
depends=('python')
source=("https://github.com/tobixen/$pkgname/archive/v$pkgver.tar.gz")

package() {
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  mkdir -p "$pkgdir/usr/bin/"
  ln -s "$pkgdir/usr/bin/" "$pkgdir/usr/sbin"
  cd "$srcdir/$pkgname-$pkgver/"
  make PREFIX=$pkgdir/usr install
  rm "$pkgdir/usr/sbin"
}


md5sums=('f8c22d8624ece531312b6305065d47c7')
