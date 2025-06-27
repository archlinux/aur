#Maintainer: TwoFinger
#Contributor: Francesco 'Kiko' Corsentino <kikocorsentino at gmail>
#Contributor: ott <matthias.christian at tiscali.de>
#Contributor: Ranguvar <ranguvar at archlinux.us>
#Contributor: Daniel YC Lin <dlin.tw at gmail>

pkgname=bvi
pkgver=1.4.2
pkgrel=2
pkgdesc="A display-oriented editor for binary files operate like 'vi' editor"
url="https://bvi.sourceforge.net"
arch=(i686 x86_64)
depends=(ncurses)
license=(GPL)
source=("http://downloads.sourceforge.net/sourceforge/bvi/$pkgname-$pkgver.src.tar.gz")
md5sums=(d96d4320a148945d3e564f2e5c6af981)

build ()
{
  cd "$srcdir/$pkgname-$pkgver"
  CFLAGS=-std=gnu17 ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
