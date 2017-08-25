# Maintainer: SanskritFritz (gmail)

pkgname=cachedir
pkgver=1.4
pkgrel=2
pkgdesc="Utility for tagging directories as cache directories."
arch=('any')
url="http://liw.fi/cachedir/"
license=('GPL')
depends=('python2-cliapp')
source=("http://code.liw.fi/debian/pool/main/c/${pkgname}/${pkgname}_${pkgver}.orig.tar.xz")

build() {
	cd "$pkgname-$pkgver"
	sed -i -e 's/python/python2/' setup.py
	sed -i -e 's/python/python2/' cachedir
	python2 setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

md5sums=('431f5b9d7629316f1a7d05a0f2fe000e')
