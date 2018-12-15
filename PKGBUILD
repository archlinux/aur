# Maintainer: SanskritFritz (gmail)

pkgname=cachedir
pkgver=1.17
pkgrel=1
pkgdesc="Utility for tagging directories as cache directories."
arch=('any')
url="http://liw.fi/cachedir/"
license=('GPL')
depends=('python2-cliapp')
source=("http://code.liw.fi/debian/pool/main/c/${pkgname}/${pkgname}_${pkgver}.orig.tar.xz")

build() {
	sed -i -e 's/python/python2/' setup.py
	sed -i -e 's/python/python2/' cachedir
	python2 setup.py build
}

package() {
	python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

md5sums=('017ad77500c2a5563aed462055a107c9')
