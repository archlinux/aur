# Maintainer: masutu <masutu dot arch at gmail dot com>
# Contributor: archtux <antonio.arias99999@gmail.com>
pkgname=movgrab
pkgver=1.2.1
pkgrel=1
pkgdesc="A command-line movie downloader."
arch=('i686' 'x86_64')
url="http://sites.google.com/site/columscode/home/movgrab"
license=('GPL3')
depends=('openssl')
source=(http://sites.google.com/site/columscode/files/$pkgname-$pkgver.tar.gz)
md5sums=('db162d6963b9753d6235f23419d08a5a')

build() {
  cd $srcdir/$pkgname-$pkgver
  make clean
  ./configure --prefix=/usr \
      --enable-ssl \
      --enable-largefiles
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm755 movgrab $pkgdir/usr/bin/movgrab
  install -Dm644 README $pkgdir/usr/share/$pkgname/README
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  install -m644 Docs/* $pkgdir/usr/share/doc/$pkgname
}

# vim:set ts=2 sw=2 et:
