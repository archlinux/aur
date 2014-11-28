# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Nathan Owe. ndowens04 at gmail dot com

pkgname=buildtorrent
pkgver=0.8
pkgrel=1
pkgdesc="A simple commandline torrent creator"
arch=('i686' 'x86_64')
url="http://mathr.co.uk/blog/torrent.html"
license=('GPL')
depends=('glibc')
source=(http://mathr.co.uk/blog/code/$pkgname-$pkgver.tar.gz)
sha256sums=('e8e27647bdb38873ac570d46c1a9689a92b01bb67f59089d1cdd08784f7052d0')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver

  make DESTDIR=${pkgdir} install
}
