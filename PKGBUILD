# Maintainer: masutu <masutu dot arch at gmail dot com>
pkgname=starplot-gliese3
pkgver=0.95
pkgrel=2
pkgdesc="Stellar data set for starplot from Third Catalogue of Nearby Stars, Gliese, 1991."
arch=('any')
url="http://starplot.org/datafiles.html"
license=('custom')
depends=('starplot')
source=(http://starplot.org/data/gliese3-$pkgver.tar.gz)
md5sums=('c4f5435c0082bd8b9a7fb2a765f25414')

build() {
  cd "$srcdir/gliese3-$pkgver"
  starpkg --dataset . --dest .
}


package() {
  cd "$srcdir/gliese3-$pkgver"
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  mkdir -p $pkgdir/usr/share/starplot/gliese3/orig-data
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -m 644 Changelog README $pkgdir/usr/share/doc/$pkgname
  install -m 644 gliese3.stars $pkgdir/usr/share/starplot
  install -m 644 gliese3.spec $pkgdir/usr/share/starplot/gliese3
  install -m 644 orig-data/* $pkgdir/usr/share/starplot/gliese3/orig-data
  install -m 644 COPYING $pkgdir/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
