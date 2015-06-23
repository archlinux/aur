# Maintainer: John "ShaggyTwoDope" Jenkins <twodopeshaggy at gmail dot com>
pkgname=lsmbox
pkgver=2.1.3
pkgrel=1
pkgdesc="A tool to monitor mbox MMDF MH and Maildir E-Mail directory formats."
arch=('i686' 'x86_64')
url="ftp://ftp.acc.umu.se/mirror/lap/lsmbox"
license=('GPL')
depends=('ncurses')
makedepends=('automake' 'autoconf')
changelog=
source=(ftp://ftp.acc.umu.se/mirror/lap/$pkgname/$pkgname-$pkgver.tar.xz)
noextract=()
md5sums=('5d239f2f065fbababa48c1ad6d057dad')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

