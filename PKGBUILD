#Contributor <Themaister> <maister@archlinux.us>

pkgname=rsound
pkgver=1.1
pkgrel=1
pkgdesc="Simple solution for streaming PCM data from client to server in real time."

url="http://github.com/Themaister/RSound"
arch=('i686' 'x86_64')

license=('GPL')
depends=()
makedepends=()

source=(http://cloud.github.com/downloads/Themaister/RSound/$pkgname-$pkgver.tar.gz)
md5sums=('dede531464e071b967714691e68b4896')

build() 
{
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr || return 1
	make || return 1
}

package()
{
	cd $srcdir/$pkgname-$pkgver
   mkdir -p $pkgdir/usr/share/man/man1
	make DESTDIR=${pkgdir} install || return 1
}

