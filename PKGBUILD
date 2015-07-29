# Maintainer: Hector Mercade Ramirez <hectormercade@gmail.com>
pkgname=overlap2d
pkgver=0.1.1
pkgrel=0
pkgdesc="Overlap2D"
arch=('any')
url="http://overlap2d.com"
license=('APACHE2')
depends=('java-environment')
source=('http://overlap2d.com/bin/overlap2d.tar.gz'
	'overlap2d')
md5sums=('SKIP'
	 'SKIP')

package() {
	cd $srcdir

	tar -xvf overlap2d.tar.gz
	mkdir -p $pkgdir/usr/share/java/$pkgname
	mkdir -p $pkgdir/usr/bin/
	install -Dm755 overlap2D-$pkgver.jar $pkgdir/usr/share/java/$pkgname/
	install -dDm755 examples $pkgdir/usr/share/java/$pkgname/
	install -dDm755 plugins $pkgdir/usr/share/java/$pkgname/
	install -Dm7557 overlap2d $pkgdir/usr/bin
	#make DESTDIR="$pkgdir/" install
}

