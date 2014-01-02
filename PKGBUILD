# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: Heine Laursen <zannvip at gmail dot com>
# Contributor: Dany Martineau <dany.luc.martineau gmail com>

pkgname=liquidwar6-extra-maps
pkgver=0.0.13beta
pkgrel=2
pkgdesc="Extra maps for Liquidwar6"
arch=('any')
url="http://www.gnu.org/software/liquidwar6/"
license=('GPL')
depends=("liquidwar6=$pkgver")
source=("http://download.savannah.gnu.org/releases/liquidwar6/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('cd104827e9cb96384ab8e2583dfa05c9')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --libexecdir=/usr/lib/liquidwar6

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
}
