# Maintainer: polyzen <polycitizen@gmail.com>
# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: <kfgz at interia dot pl>
# Contributor: <damir at archlinux dot org>

pkgname=ms-sys
pkgver=2.4.1
pkgrel=3
pkgdesc="Used to create Microsoft compatible boot records"
arch=('i686' 'x86_64')
url="http://ms-sys.sourceforge.net/"
license=('GPL')
depends=('glibc')
source=(http://prdownloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('d31e7ef3db6bd77dbb13df11057fa0f2')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr MANDIR=/usr/share/man DESTDIR="$pkgdir" install
}
