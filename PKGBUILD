# Maintainer: Lauri Niskanen <ape@ape3000.com>

pkgname=samsungctl
pkgver=0.5.0
pkgrel=1
pkgdesc="Remote control Samsung televisions via TCP/IP connection"
arch=('any')
url="https://github.com/Ape/samsungctl"
license=('MIT')
depends=('python-setuptools')
makedepends=()
source=("https://github.com/Ape/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('958b063fb15b4b92d8b009ba7088277de1927096a080cf7784c459227947c3be')

package() { 
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -pm755 $pkgdir/usr/share/licenses/$pkgname
	cp LICENSE $pkgdir/usr/share/licenses/$pkgname/
	mkdir -pm755 $pkgdir/etc
	cp samsungctl.conf $pkgdir/etc/
	python setup.py install --root="$pkgdir/" --optimize=1
}
