# Maintainer: SanskritFritz (gmail)

pkgname=dupfiles
pkgver=5.8
pkgrel=1
pkgdesc="Find and hardlink duplicate files."
arch=('any')
url="http://liw.fi/dupfiles/"
license=('GPL')
depends=('python2')
source=("http://code.liw.fi/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.orig.tar.xz")

build() {
	cd "$pkgname-$pkgver"
	sed -i -e 's/python/python2/' setup.py
	sed -i -e 's/python/python2/' dupfiles
	python2 setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

md5sums=('63156d0aa8720b7368b7dacee9319ee5')
