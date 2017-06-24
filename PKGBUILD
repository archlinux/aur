# Maintainer: Alexandre Bouvier <contact AT amb DOT tf>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>
# Contributor: Philipp Joram <phijor AT t-online DOT de>
pkgname=('python-axolotl-curve25519' 'python2-axolotl-curve25519')
pkgbase=python-axolotl-curve25519
pkgver=0.1
pkgrel=1
pkgdesc="Python wrapper for curve25519 library"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/tgalal/python-axolotl-curve25519"
license=('GPL3')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgbase::1}/$pkgbase/$pkgbase-$pkgver.tar.gz")
md5sums=('f28d902df9044f0bf86a35a4bd2ec092')

prepare() {
	cp -a "$pkgbase-$pkgver"{,-python2}
}

build() {
	cd "$srcdir/$pkgbase-$pkgver"
	python setup.py build

	cd "$srcdir/$pkgbase-$pkgver-python2"
	python2 setup.py build
}

package_python-axolotl-curve25519() {
	depends=('python')

	cd "$pkgbase-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-axolotl-curve25519() {
	depends=('python2')

	cd "$pkgbase-$pkgver-python2"
	python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
