# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=python-defer
pkgver=1.0.6
pkgrel=2
pkgdesc="Small framework for asynchrouns programming"
arch=('any')
url="https://launchpad.net/python-defer"
license=('GPL')
depends=('python3')
makedepends=('python-setuptools')
checkdepends=('python-nose-cover3')
source=("$pkgname-$pkgver.tar.gz::http://archive.ubuntu.com/ubuntu/pool/main/p/$pkgname/${pkgname}_${pkgver}.orig.tar.gz")
sha512sums=('2ed6a1c2beea4db14122602d52443946d777ce17a5ca49eeaabbf8b1740c372b38dd8e6f5810d91d78e1f5a013aab95d6012abc5101bca9cea25866881ba9403')

build() {
	cd "defer-$pkgver"
	python setup.py build
}

check() {
	cd "defer-$pkgver"
	python setup.py nosetests
}

package() {
	cd "defer-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
