# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Samantha Baldwin <fuhsaz 'plus' aur 'at' cryptic 'dot' li>

pkgname=fusepak
pkgver=0.5
pkgrel=2
pkgdesc="Mount PACK and WAD files via FUSE."
arch=('x86_64' 'i686')
url="http://fusepak.sourceforge.net/"
license=('GPLv2')
depends=('fuse')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('7be66f6f9bdbef20d821784ad476039b')

build() { 
  cd $srcdir/$pkgname-$pkgver/
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
