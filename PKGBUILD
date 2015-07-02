# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname=('python2-oslo-config-liberty')
pkgver=1.12.1
pkgrel=1
pkgdesc="parsing command line arguments and .ini style configuration files"
arch=('any')
url="https://pypi.python.org/pypi/oslo.config/1.12.1"
license=('GPL')
provides=("python2-oslo-config")
makedepends=('python2-setuptools' 'python2')
source=("https://pypi.python.org/packages/source/o/oslo.config/oslo.config-$pkgver.tar.gz")
md5sums=('b20e00b2a5ec129a3b58d84308f381ae')

build() {
	cd "$srcdir/oslo.config-$pkgver"
	python2 setup.py build
	echo ${pkgver} > versioninfo
}

package_python2-oslo-config-liberty() {

	depends=('python2' 'python2-setuptools')

	cd "$srcdir/oslo.config-$pkgver"
	python2 setup.py install --root=${pkgdir}
}
