# Maintainer: Samantha Baldwin <sbaldwin 'at' ednos 'dot' net>

pkgname=fusepak
pkgver=0.5
pkgrel=1
pkgdesc="Mount PACK and WAD files via FUSE."
arch=('x86_64' 'i686')
url="http://fusepak.sourceforge.net/"
license=('GPLv2')
depends=('fuse')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('7be66f6f9bdbef20d821784ad476039b')

build() { 
  cd $srcdir/$pkgname-$pkgver/
  ./configure
  make PREFIX=/usr
}

package() {
  cd $srcdir/$pkgname-$pkgver/
  make PREFIX=/usr DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
