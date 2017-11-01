# Maintainer: Lauri Niskanen <ape@ape3000.com>

pkgname=samsungctl
pkgver=0.7.0
pkgrel=1
pkgdesc="Remote control Samsung televisions via TCP/IP connection"
arch=('any')
url="https://github.com/Ape/samsungctl"
license=('MIT')
depends=('python-setuptools')
makedepends=()
source=("https://github.com/Ape/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('6b35c7255e0a718dcb29c653153bc29f28c48d4180572c77a6c985f90f501dec')

package() { 
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -pm755 $pkgdir/usr/share/licenses/$pkgname
	cp LICENSE $pkgdir/usr/share/licenses/$pkgname/
	mkdir -pm755 $pkgdir/etc
	cp samsungctl.conf $pkgdir/etc/
	python setup.py install --root="$pkgdir/" --optimize=1
}
