# Contributor: Troy C < rstrox -ta yahoo -tod com >

_name=os_networksv2_python_novaclient_ext
pkgname=python-os-networksv2-python-novaclient-ext
pkgver=0.26
pkgrel=1
pkgdesc="Adds rackspace networks support to python-novaclient."
arch=('any')
url="http://pypi.python.org/pypi/os_networksv2_python_novaclient_ext/"
license=('GPL')
depends=('python-novaclient' 'python-httplib2' 'python-prettytable' 'python-simplejson' 'python-iso8601')
makedepends=('python-setuptools')
provides=("$pkgname=$pkgver")
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
md5sums=('877367a926ebc24b0a2fdbbf9e21a041')


build() {
	cd "$_name-pkgver"
	python setup.py build
}

package() {
	cd "$_name-pkgver"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
