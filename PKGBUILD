# Maintainer: willemw <willemw12@gmail.com>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=podget
pkgver=1.0.0
pkgrel=1
pkgdesc='Simple tool to automate downloading of podcasts'
arch=(any)
#url=https://podget.sourceforge.net
url=https://github.com/dvehrs/podget
license=(GPL-3.0-or-later)
depends=(wget)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/V$pkgver.tar.gz")
sha256sums=('2c8ec81002d03a4e3b207ee39773404fc5962cfbb1bd6711607f183c408cdc0d')

package() {
  install -Dm644 $pkgname-$pkgver/README -t "$pkgdir/usr/share/$pkgname"
  cp -a $pkgname-$pkgver/SCRIPTS/ "$pkgdir/usr/share/$pkgname/scripts/"

  make -C $pkgname-$pkgver prefix=/usr DESTDIR="$pkgdir/" install
}
