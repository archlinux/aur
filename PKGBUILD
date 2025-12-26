#Maintainer: TwoFinger
#Contributor: Francesco 'Kiko' Corsentino <kikocorsentino at gmail>
#Contributor: ott <matthias.christian at tiscali.de>
#Contributor: Ranguvar <ranguvar at archlinux.us>
#Contributor: Daniel YC Lin <dlin.tw at gmail>

pkgname=bvi
pkgver=1.5.0
pkgrel=1
pkgdesc="A display-oriented editor for binary files operate like 'vi' editor"
url="https://bvi.sourceforge.net"
arch=(i686 x86_64)
depends=(ncurses)
license=(GPL)
source=("http://downloads.sourceforge.net/sourceforge/bvi/$pkgname-$pkgver.src.tar.gz")
md5sums=(056623e81e1ec1c378c4abcfa6fbc87c)

build ()
{
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
