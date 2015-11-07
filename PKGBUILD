# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: <kfgz at interia dot pl>
# Contributor: <damir at archlinux dot org>

pkgname=ms-sys
pkgver=2.5.1
pkgrel=1
pkgdesc="Used to create Microsoft compatible boot records"
arch=('i686' 'x86_64')
url="http://ms-sys.sourceforge.net/"
license=('GPL')
depends=('glibc')
source=(http://prdownloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('46ac427ffb520cdb77edbaf77e2b55f3ab8c6b02f3e5d389662c9a85d9f688ef')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr MANDIR=/usr/share/man DESTDIR="$pkgdir" install
}
