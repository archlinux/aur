# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=throttle
pkgver=1.2
pkgrel=1
pkgdesc="Copies the standard input to the standard output while limiting bandwidth to the specified maximum"
arch=('i686' 'x86_64')
url="http://klicman.org/throttle/"
license=('GPL')
source=(ftp://ftp.fi.freebsd.org/pub/FreeBSD/ports/distfiles/$pkgname-$pkgver.tar.gz)
md5sums=('bb8abf5a9a63ed7d80951f056543a88c')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
