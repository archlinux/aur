# Maintainer: Troy C < rstrox -ta yahoo -tod com >

pkgname=('python-oslo-i18n' 'python2-oslo-i18n')
pkgver=1.6.0
pkgrel=1
pkgdesc="OpenStack Common Libraries - Internationalization and translation library"
arch=('any')
url="https://github.com/openstack/oslo.i18n"
license=('GPL')
provides=("$pkgname=$pkgver")
makedepends=('python-setuptools' 'python2-setuptools' 'python-pbr>=0.8' 'python2-pbr>=0.8')
source=("https://pypi.python.org/packages/source/o/oslo.i18n/oslo.i18n-$pkgver.tar.gz")
md5sums=('c109e20b99bb0ec8d85a583bf503e6a5')

build() {
	cd "$srcdir/oslo.i18n-$pkgver"
	python setup.py build
	python2 setup.py build
	echo ${pkgver} > versioninfo
}

package_python-oslo-i18n() {

	depends=('python' 'python-babel>=1.3' 'python-six>=1.9.0' 'python-pbr>=0.8')

	cd "$srcdir/oslo.i18n-$pkgver"
	python setup.py install --root=${pkgdir}
}

package_python2-oslo-i18n() {

	depends=('python2' 'python2-babel>=1.3' 'python2-six>=1.9.0' 'python2-pbr>=0.8')

	cd "$srcdir/oslo.i18n-$pkgver"
	python2 setup.py install --root=${pkgdir}
}
