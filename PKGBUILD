# Maintainer: Valerio Pizzi (pival81) <pival81@yahoo.com>

pkgname=goterminal
pkgver=0.0.5
pkgrel=2
pkgdesc="Elegant and efficient Linux terminal"
arch=("x86_64" "i386")
url="http://rungoterminal.com"
license=('APSL 2.0')
options=(!strip)
noextract=("$pkgname-$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz::http://products.sophiware.com/download/goterminal/linux-all"
	"sophiware-$pkgname.desktop")
md5sums=('74acaa13daa54c1185d255bbc5422758'
	 'dd96df7c8bbc48398b1d4d8ffd856d17')

prepare() {
	cd $srcdir
	mkdir goterminal
	tar -zxvf $pkgname-$pkgver.tar.gz -C goterminal
}

package() {
	mkdir -p $pkgdir/{opt,usr/{share/applications,local/bin}}
	mv $srcdir/$pkgname $pkgdir/opt/$pkgname
	ln -s /opt/$pkgname/$pkgname $pkgdir/usr/local/bin/$pkgname
	install -m644 $srcdir/sophiware-$pkgname.desktop $pkgdir/usr/share/applications
} 

