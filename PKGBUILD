# Maintainer: Jasper Follas follasjj@live.co.uk

pkgname=glvis
pkgver=1.6
pkgrel=2
pkgdesc="A PVS (Potentially Visible Set) builder specially designed to 
be used with OpenGL ports of the DOOM game engine."
arch=('i686' 'x86_64')
url="http://vavoom-engine.com/glvis.php"
license=('GPL')
source=(http://downloads.sourceforge.net/vavoom/$pkgname-$pkgver.tar.gz)
md5sums=('d75dff784e3b5cb193a5cd6011ce812e')
	
build() {
 cd $srcdir/$pkgname-$pkgver
 sh autogen.sh
 ./configure --prefix=/usr
 make || return 1
}

package() {
 cd $srcdir/$pkgname-$pkgver
 make DESTDIR=$pkgdir install
}
