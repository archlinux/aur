# Maintainer: Lauri Niskanen <ape@ape3000.com>

pkgname=samsungctl
pkgver=0.5.1
pkgrel=1
pkgdesc="Remote control Samsung televisions via TCP/IP connection"
arch=('any')
url="https://github.com/Ape/samsungctl"
license=('MIT')
depends=('python-setuptools')
makedepends=()
source=("https://github.com/Ape/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('9e996598f15e55faecd4f0cf3f76da3bf7810a65cba966a0068c0a2c47e631ea')

package() { 
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -pm755 $pkgdir/usr/share/licenses/$pkgname
	cp LICENSE $pkgdir/usr/share/licenses/$pkgname/
	mkdir -pm755 $pkgdir/etc
	cp samsungctl.conf $pkgdir/etc/
	python setup.py install --root="$pkgdir/" --optimize=1
}
