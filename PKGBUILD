# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python2-hupper
pkgver=1.10.3
pkgrel=1
pkgdesc="Integrated process monitor for developing servers"
arch=('any')
url="https://github.com/Pylons/hupper/"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
# checkdepends=('python2-watchdog' 'python2-pytest-cov' 'python2-pytest-runner')
changelog=CHANGES.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/h/hupper/hupper-$pkgver.tar.gz")
sha256sums=('cd6f51b72c7587bc9bce8a65ecd025a1e95f1b03284519bfe91284d010316cd9')

build() {
	cd "hupper-$pkgver"
	python2 setup.py build
}

# check() {
# 	cd "hupper-$pkgver"
# 	python2 setup.py pytest -v
# }

package() {
	cd "hupper-$pkgver"
	python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
