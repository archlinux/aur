pkgname=python2-randomtools
pkgver=d6eda19
pkgrel=1
pkgdesc="Tools for randomizers"
arch=(any)
url="https://github.com/abyssonym/randomtools"
license=("unknown")
source=("randomtools.zip::https://github.com/abyssonym/randomtools/archive/d6eda19a57ff80b71c1cb803fb5e82387849e97a.zip")
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
md5sums=('56a289b41ce2eb5861a89429bf3fd5de')
