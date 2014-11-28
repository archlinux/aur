# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=ftwin
pkgver=0.8.5
pkgrel=1
pkgdesc="A tool useful to find duplicate files according to their content on your file system."
arch=('i686' 'x86_64')
url="http://freecode.com/projects/ftwin"
license=('APACHE')
depends=('apr-util' 'check' 'libpuzzle')
optdepends=('doxygen: generating docs'
            'graphviz: generating graphs')
source=(ftp://ftp.freebsd.org/pub/FreeBSD/ports/distfiles/$pkgname-$pkgver.tar.bz2)
sha256sums=('03dec36503b3c781f287b4427e99d9d1ccc704f1d9e11eadcd630e4c29dea0ce')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver

  make DESTDIR=${pkgdir} install
}
