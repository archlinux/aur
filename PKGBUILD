# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Samantha Baldwin <fuhsaz 'plus' aur 'at' cryptic 'dot' li>

pkgname=fusepak
pkgver=0.5
pkgrel=3
pkgdesc="Mount PACK and WAD files via FUSE."
arch=('x86_64' 'i686')
url="http://fusepak.sourceforge.net/"
license=('GPLv2')
depends=('fuse')
# the project is gone from SourceForge; Wayback Machine copy of the original tarball (same md5)
source=($pkgname-$pkgver.tar.gz::https://web.archive.org/web/20150803202234id_/http://iweb.dl.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('7be66f6f9bdbef20d821784ad476039b')
sha256sums=('103d826811ad9576e516fd70949427bad4461b65ef423cab1755b71a5a244034')

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
