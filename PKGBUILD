# Contributor: Tom Killian <tom@archlinux.org>
# Contributor: Nikos Kouremenos (zeppelin) kourem at gmail dot com
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=autocutsel
pkgver=0.10.0
pkgrel=3
pkgdesc="synchronizes the two copy/paste buffers mainly used by X applications"
arch=('x86_64')
depends=('libxaw')
source=(https://github.com/sigmike/autocutsel/releases/download/$pkgver/autocutsel-$pkgver.tar.gz)
url="https://github.com/sigmike/autocutsel"
install=autocutsel.install
license=('GPL')
md5sums=('7d5b96e5f7b79b883d8350f104043366')

build() {
  cd "${srcdir}"/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}
package() {
  cd "${srcdir}"/$pkgname-$pkgver
  make prefix="${pkgdir}"/usr install 
}
