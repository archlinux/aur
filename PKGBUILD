# Maintainer: Lauri Niskanen <ape@ape3000.com>

pkgname=samsungctl
pkgver=0.3.0
pkgrel=1
pkgdesc="Remote control Samsung televisions via TCP/IP connection"
arch=('any')
url="https://github.com/Ape/samsungctl"
license=('MIT')
depends=('python-setuptools')
makedepends=()
source=("https://github.com/Ape/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('930f73ee827f5c7b244fc94f134f55af59dcde30ba1ec257597be1d6a870cecd')

package() { 
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -pm755 $pkgdir/usr/share/licenses/$pkgname
	cp LICENSE $pkgdir/usr/share/licenses/$pkgname/
	mkdir -pm755 $pkgdir/etc
	cp samsungctl.conf $pkgdir/etc/
	python setup.py install --root="$pkgdir/" --optimize=1
}
