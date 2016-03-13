# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: <kfgz at interia dot pl>
# Contributor: <damir at archlinux dot org>

pkgname=ms-sys
pkgver=2.4.1
pkgrel=1
epoch=1
pkgdesc="Used to create Microsoft compatible boot records"
arch=('i686' 'x86_64')
url="http://ms-sys.sourceforge.net/"
license=('GPL')
depends=('glibc')
source=(http://prdownloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('cca2a36cf0a18c123088210dc5b406cc825e2f3695a7858238090be68ed98c61')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr MANDIR=/usr/share/man DESTDIR="$pkgdir" install
}
