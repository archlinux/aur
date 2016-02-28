# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: <kfgz at interia dot pl>
# Contributor: <damir at archlinux dot org>

pkgname=ms-sys
pkgver=2.5.3
pkgrel=1
pkgdesc="Used to create Microsoft compatible boot records"
arch=('i686' 'x86_64')
url="http://ms-sys.sourceforge.net/"
license=('GPL')
depends=('glibc')
source=(http://prdownloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('e03e78f6684e30dbf9d97ecb1d75c1bf16350b1d3e4273a3a224cac504723256')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr MANDIR=/usr/share/man DESTDIR="$pkgdir" install
}
