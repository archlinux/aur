# Maintainer: Tobias Brox <t-arch@tobixen.no>
pkgname=thrash-protect
pkgver=0.11.0
pkgrel=3
pkgdesc="Simple-Stupid user-space program protecting a linux host from thrashing."
url="https://github.com/tobixen/thrash-protect"
arch=('any')
license=('GPL')
depends=('python')
source=("https://github.com/tobixen/$pkgname/archive/v$pkgver.tar.gz")

package() {
  mkdir -p "$pkgdir/usr/sbin/"
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  cd "$srcdir/$pkgname-$pkgver/"
  make PREFIX=$pkgdir/usr install
  mv $pkgdir/usr/sbin/* $pkgdir/sbin/
}


md5sums=('73634f06b4b794777e6dcc588d171b49')
