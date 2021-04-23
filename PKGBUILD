# Contributor: Tom Killian <tom@archlinux.org>
# Contributor: Nikos Kouremenos (zeppelin) kourem at gmail dot com
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=autocutsel
pkgver=0.10.1
pkgrel=1
pkgdesc="synchronizes the two copy/paste buffers mainly used by X applications"
arch=('x86_64')
depends=('libxaw')
source=(https://github.com/sigmike/autocutsel/releases/download/$pkgver/autocutsel-$pkgver.tar.gz)
url="https://github.com/sigmike/autocutsel"
install=autocutsel.install
license=('GPL')
md5sums=('4e891b51745891d3367f085ff84610de')

build() {
  cd "${srcdir}"/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}
package() {
  cd "${srcdir}"/$pkgname-$pkgver
  make prefix="${pkgdir}"/usr install 
}
