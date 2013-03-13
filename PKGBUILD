# Contributor: Johannes Dewender arch at JonnyJD dot net
# Contributor: Nut543 <kfs1@online.no>
pkgname=tmake 
pkgver=2.12 
pkgrel=3
pkgdesc="multiplatform makefile generator in Perl" 
arch=('any')
url="http://tmake.sourceforge.net/"
license=('custom')
depends=('perl>=5') 
makedepends=('patch')
source=(http://downloads.sourceforge.net/tmake/$pkgname-$pkgver.tar.bz2
'tmakepath.patch') 
md5sums=('38dac96177f7c388ac9c1d094db5a5d7'
         '47cf355ddbaad762c0581cd039eab576')

build() { 
  cd $srcdir
  patch -p0 -N < tmakepath.patch || exit 1
}

package() {
  cd $srcdir/$pkgname-$pkgver 

  mkdir -p $pkgdir/usr/lib/$pkgname-$pkgver
  cp -R lib/* $pkgdir/usr/lib/$pkgname-$pkgver/
  cp -R bin $pkgdir/usr/ 

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp LICENSE $pkgdir/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
