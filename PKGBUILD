# Maintainer: Leo Verto <leotheverto+aur@gmail.com>
pkgname=netmask
pkgver=2.4
pkgrel=3
pkgdesc="The swiss army knife of addressing."
arch=('x86_64')
url="http://trap.mtview.ca.us/~talby/"
license=('GPL2')
makedepends=()
source=(http://trap.mtview.ca.us/~talby/$pkgname\_$pkgver.tar.gz)
sha256sums=('316b1169614303a692074d5a7e59c3e4e208bbec1cb961c47b13018b9008d34e')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --infodir=/usr/share/info --mandir=/usr/share/man
  make
}

check() {
  cd "$pkgname-$pkgver"

  make -k check
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
