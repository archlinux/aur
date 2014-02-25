# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Maurizio Porrato <maurizio.porrato@gmail.com>

pkgname=python2-wokkel
pkgver=0.7.1
pkgrel=2
_libname=${pkgname/python2-/}
pkgdesc="Twisted Jabber support library"
license=('custom:"Wokkel License"')
url="http://wokkel.ik.nu/"
source=("http://wokkel.ik.nu/releases/$pkgver/wokkel-$pkgver.tar.gz")
arch=(any)
makedepends=('python2-setuptools')
depends=('twisted')

build() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py install --skip-build -O1 --root="$pkgdir"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('5306591c28f406873fad1d4eba27e5e081a4a7f37e3725b24afd47b3137f4965')
