pkgname=python2-randomtools
epoch=1
pkgver=16ff71e
pkgrel=1
pkgdesc="Tools for randomizers"
arch=(any)
url="https://github.com/abyssonym/randomtools"
license=("unknown")
source=("randomtools.zip::https://github.com/abyssonym/randomtools/archive/16ff71ec89ad387b664328326012d1b956269ccd.zip")
depends=(python2)
makedepends=(dos2unix)


prepare() {
	cd randomtools-*
	find . -type f -exec dos2unix {} \;
}

package() {
	cd randomtools-*
	find . -name '*.py' -exec install -Dm755 {} "$pkgdir/usr/lib/python2.7/site-packages/randomtools/"{} \;
	python2 -m compileall "$pkgdir"
}
md5sums=('55003616c3cdd62d74be875739ba2aa8')
