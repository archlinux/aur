# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Maurizio Porrato <maurizio.porrato@gmail.com>

pkgname=python2-wokkel
pkgver=0.7.0
pkgrel=1
_libname=${pkgname/python2-/}
pkgdesc="Twisted Jabber support library"
license=('custom:"Wokkel License"')
url="http://wokkel.ik.nu/"
source=("http://wokkel.ik.nu/releases/$pkgver/wokkel-$pkgver.tar.gz")
arch=(any)
makedepends=('python2-distribute')
depends=('twisted')
provides=('python-wokkel')
replaces=('python-wokkel')

build() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py install -O1 --prefix=/usr --root="$pkgdir"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('b4a29fd9238e0047a846b78e703a3310c53c7a6e16b55b0be80518c47f86da66')
