# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: Heine Laursen <zannvip at gmail dot com>
# Contributor: Dany Martineau <dany.luc.martineau gmail com>

pkgname=liquidwar6-extra-maps
pkgver=0.4.3681
pkgrel=1
pkgdesc="Extra maps for Liquidwar6"
arch=('any')
url="http://www.gnu.org/software/liquidwar6/"
license=('GPL')
depends=("liquidwar6=$pkgver")
source=("http://download.savannah.gnu.org/releases/liquidwar6/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('32ffe94781aade93ca26919220b434a26dbde9260655bf6733f19d5df41abc65')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --libexecdir=/usr/lib/liquidwar6
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
}
