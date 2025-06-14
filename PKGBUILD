# Maintainer: Mike Pento <mjpento@gmail.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: lspci <agm2819[[aaaa]][[tttt]]gmail[[dd]][[oo]][[tt]][[cc]][[oo]][[mm]]>
# Contributor: Mario Blättermann <mariobl@gnome.org>

pkgname=wmbatteries
pkgver=0.1.3
pkgrel=9
pkgdesc="a dockapp based on wmacpiload"
url="http://sourceforge.net/projects/$pkgname/"
depends=('libxpm' 'libxext')
license=('GPL')
arch=('i686' 'x86_64')
options+=('!debug')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('ed74f6f0e3945731615e92efed00f4dd')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man
  make CFLAGS="$(CFLAGS) -std=gnu89"
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

