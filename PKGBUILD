# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Troy C < rstrox -ta yahoo -tod com >

_name=os_diskconfig_python_novaclient_ext
pkgname=python-os-diskconfig-python-novaclient-ext
pkgver=0.1.3
pkgrel=1
pkgdesc="Disk Config extension for python-novaclient"
arch=('any')
url="http://pypi.python.org/pypi/os_diskconfig_python_novaclient_ext/"
license=('GPL')
depends=('python' 'python-novaclient' 'python-httplib2' 'python-prettytable' 'python-simplejson' 'python-iso8601')
makedepends=('python-setuptools')
provides=("$pkgname=$pkgver")
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
md5sums=('00900ee89069f92c301366c7d5c18ec5')


build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}
