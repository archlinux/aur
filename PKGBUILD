# Maintainer: patri9ck <patri9ck@gmail.com>
pkgname=a2ln
pkgver=1.1.13
pkgrel=1
pkgdesc="Android 2 Linux Notifications Server"
arch=('any')
url="https://github.com/patri9ck/a2ln-server"
license=('GPL3')
makedepends=('python-build' 'python-installer' 'python-wheel')
depends=('python' 'python-pyzmq' 'python-gobject' 'python-pillow' 'python-qrcode')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('edc7d8ca8f9c40f0ff9cb0aa09dd5a79b83f8e71d95df8a8e0456704ced97a92')

build() {
	cd "$srcdir/a2ln-server-$pkgver/"

	make
}

package() {
	cd "$srcdir/a2ln-server-$pkgver/"
	
	make install DESTDIR="$pkgdir"
}
