# Maintainer: patri9ck <patri9ck@gmail.com>
pkgname=a2ln
pkgver=1.1.14
pkgrel=1
pkgdesc="Android 2 Linux Notifications Server"
arch=('any')
url="https://github.com/patri9ck/a2ln-server"
license=('GPL3')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
depends=('python' 'python-pyzmq' 'python-gobject' 'python-pillow' 'python-qrcode')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('09f9a2dbfb75ea742f259e5212243b5ddef76a09b5fb0a7fb21b6b0c96eeb21b')

build() {
	cd "$srcdir/a2ln-server-$pkgver/"

	make
}

package() {
	cd "$srcdir/a2ln-server-$pkgver/"
	
	make install DESTDIR="$pkgdir"
}
