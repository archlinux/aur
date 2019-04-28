# Maintainer: Klotz <vanziegelstein@gmail.com>
pkgname=baudrate
pkgver=1.0
pkgrel=1
pkgdesc="Tool to find the baudrate of a serial device"
arch=('x86_64')
url="https://code.google.com/archive/p/baudrate/"
license=('MIT')
depends=('python2' 'python2-pyserial')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/baudrate/baudrate-1.0.tar.gz")
md5sums=('df993cdae598f17748688a1a1ea27829')

prepare() {
	cd "$pkgname-$pkgver/src/"
	sed -i "1s/python/python2/" "${pkgname}.py"
}

package() {

	install -d "$pkgdir/usr/share/licenses/$pkgname"    
	install -d "$pkgdir/usr/bin"    

	install -m755 "$srcdir/$pkgname-$pkgver/src/baudrate.py" "$pkgdir/usr/bin/baudrate.py"
	install -m644 "$srcdir/$pkgname-$pkgver/src/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
