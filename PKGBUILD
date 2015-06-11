# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname=('python2-oslo-i18n-kilo')
pkgver=1.5.0
pkgrel=1
pkgdesc="OpenStack Common Libraries - Internationalization and translation library"
arch=('any')
url="https://github.com/openstack/oslo.i18n"
license=('GPL')
provides=("python2-oslo-i18n")
makedepends=('python2-setuptools' 'python2-pbr>=0.8')
source=("https://pypi.python.org/packages/source/o/oslo.i18n/oslo.i18n-$pkgver.tar.gz")
md5sums=('4ed6035729343bb4becdc5ffe6dc8e24')

build() {
	cd "$srcdir/oslo.i18n-$pkgver"
	python2 setup.py build
	echo ${pkgver} > versioninfo
}

package_python2-oslo-i18n-kilo() {

	depends=('python2' 'python2-babel>=1.3' 'python2-six>=1.9.0' 'python2-pbr>=0.8')

	cd "$srcdir/oslo.i18n-$pkgver"
	python2 setup.py install --root=${pkgdir}
}
