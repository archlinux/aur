# Maintainer: schuay <jakob.gruber@gmail.com>
# Contributor: Denis Dubiella <ddspeed2 at gmail dot com>

pkgname=bluemoon
pkgver=1.3.2
pkgrel=2
pkgdesc="Artificial Intelligence for Reiner Knizia's Blue Moon card game"
arch=('i686' 'x86_64')
url="http://keldon.net/bluemoon/"
license=('GPL')
depends=('gtk2')
source=("http://keldon.net/bluemoon/$pkgname-$pkgver.tar.gz" "bluemoon.desktop")
md5sums=('86af3a644b2a293a18d0e3d9e86c3279'
         'c2302dc1835962eb0d2a6d052cd6c68b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -D -m644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
