# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=pidgin-encryption
pkgver=3.1
pkgrel=3
pkgdesc="A Pidgin plugin providing transparent RSA encryption using NSS"
arch=('x86_64')
license=('GPL')
url="http://pidgin-encrypt.sourceforge.net/"
depends=('pidgin' 'nss')
source=(http://downloads.sourceforge.net/pidgin-encrypt/$pkgname-$pkgver.tar.gz)
md5sums=('d839eec602c21f913b32b742dc512f4b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
