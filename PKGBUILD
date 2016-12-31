# Maintainer: Lauri Niskanen <ape@ape3000.com>

pkgname=samsungctl
pkgver=0.6.0
pkgrel=1
pkgdesc="Remote control Samsung televisions via TCP/IP connection"
arch=('any')
url="https://github.com/Ape/samsungctl"
license=('MIT')
depends=('python-setuptools')
makedepends=()
source=("https://github.com/Ape/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('92e21be97a91314fe62f3abbfdfca6e8252bb1f3a6367177d4db7ce92f8f25a0')

package() { 
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -pm755 $pkgdir/usr/share/licenses/$pkgname
	cp LICENSE $pkgdir/usr/share/licenses/$pkgname/
	mkdir -pm755 $pkgdir/etc
	cp samsungctl.conf $pkgdir/etc/
	python setup.py install --root="$pkgdir/" --optimize=1
}
