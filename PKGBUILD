# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: Heine Laursen <zannvip at gmail dot com>
# Contributor: Dany Martineau <dany.luc.martineau gmail com>

pkgname=liquidwar6-extra-maps
pkgver=0.2.3551
pkgrel=1
pkgdesc="Extra maps for Liquidwar6"
arch=('any')
url="http://www.gnu.org/software/liquidwar6/"
license=('GPL')
depends=("liquidwar6=$pkgver")
source=("http://download.savannah.gnu.org/releases/liquidwar6/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1acb398907d2c89e26f0f7baae11e88024968be52fa0c6534ce8305b32271f6b')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --libexecdir=/usr/lib/liquidwar6

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
}
