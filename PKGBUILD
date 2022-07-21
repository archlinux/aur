# Maintainer: Steven Tang <xosdy.t at gmail dot com>

pkgname=scws
pkgver=1.2.3
pkgrel=1
pkgdesc='Simple Chinese Word Segmentation'
arch=('x86_64')
url="http://www.xunsearch.com/scws/"
license=('BSD')
makedepends=('go')
source=(http://www.xunsearch.com/scws/down/scws-${pkgver}.tar.bz2)
sha256sums=('60d50ac3dc42cff3c0b16cb1cfee47d8cb8c8baa142a58bc62854477b81f1af5')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
