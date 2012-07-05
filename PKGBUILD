# Maintainer: Mike Sampson <mike at sambodata dot com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: froggie <sullivanva@gmail.com>

pkgname=pstotext
pkgver=1.9
pkgrel=2
pkgdesc="Converts Postscript to text"
arch=('i686' 'x86_64')
url="http://www.cs.wisc.edu/~ghost/doc/pstotext.htm"
license=('GPL')
depends=('ghostscript')
source=(ftp://ftp.uni-frankfurt.de/pub/Mirrors2/gentoo.org/distfiles/$pkgname-$pkgver.tar.gz)
md5sums=('64576e8a10ff5514e285d98b3898ae78')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm755 pstotext $pkgdir/usr/bin/pstotext
  install -Dm644 pstotext.1 $pkgdir/usr/share/man/man1/pstotext.1
}
