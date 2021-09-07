# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=python2-defer
pkgver=1.0.6
pkgrel=2
pkgdesc="Small framework for asynchrouns programming"
arch=('any')
url="https://launchpad.net/python-defer"
license=('GPL')
depends=('python2')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::http://archive.ubuntu.com/ubuntu/pool/main/p/python-defer/python-defer_${pkgver}.orig.tar.gz")
sha512sums=('2ed6a1c2beea4db14122602d52443946d777ce17a5ca49eeaabbf8b1740c372b38dd8e6f5810d91d78e1f5a013aab95d6012abc5101bca9cea25866881ba9403')

build() {
	cd "defer-$pkgver"
	python2 setup.py build
}

package() {
	cd "defer-${pkgver}"
	python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
