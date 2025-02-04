# Maintainer: robertfoster

pkgname=strobe
pkgver=1.06
pkgrel=2
pkgdesc="Super optimised TCP port surveyor (in honour of Julian Assange)"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://ftp.cerias.purdue.edu/pub/tools/unix/scanners/strobe/"
source=("http://ftp.cerias.purdue.edu/pub/tools/unix/scanners/strobe/$pkgname-$pkgver.tar.gz")

build() {
  cd $srcdir/$pkgname
  make
}

package() {
  cd $srcdir/$pkgname
  mkdir -p $pkgdir/usr/{lib,man,bin}
  mkdir -p $pkgdir/usr/man/man1
  make INSTALLDIR=$pkgdir/usr/bin \
    LIBDIR=$pkgdir/usr/lib MANDIR=$pkgdir/usr/man/man1 install

}

sha256sums=('07ff7b3911d834cdca484c3881dc5646d2c34ba337c38a6cde909a2b06bb85ab')
