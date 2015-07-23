# Maintainer: masutu <masutu dot arch at gmail dot com>
pkgname=starplot-yale5
pkgver=0.95
pkgrel=2
pkgdesc="Stellar data set for starplot from Yale Bright Star Catalog, 5th Rev. Ed., Hoffleit, 1991."
arch=('any')
url="http://starplot.org/datafiles.html"
license=('custom')
depends=('starplot')
source=(http://starplot.org/data/yale5-$pkgver.tar.gz)
md5sums=('6a5c7f633db97c2ca20e492bab3107d3')

build() {
  cd "$srcdir/yale5-$pkgver"
  starpkg --dataset . --dest .
}

package() {
  cd "$srcdir/yale5-$pkgver"
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  mkdir -p $pkgdir/usr/share/starplot/yale5/orig-data
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -m 644 Changelog README $pkgdir/usr/share/doc/$pkgname
  install -m 644 yale5.stars $pkgdir/usr/share/starplot
  install -m 644 yale5.spec $pkgdir/usr/share/starplot/yale5
  install -m 644 orig-data/* $pkgdir/usr/share/starplot/yale5/orig-data
  install -m 644 COPYING $pkgdir/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
