# Contributor: Troy C < rstrox -ta yahoo -tod com >

_name=os_virtual_interfacesv2_python_novaclient_ext
pkgbase=python-os-virtual-interfacesv2-python-novaclient-ext
pkgname=('python-os-virtual-interfacesv2-python-novaclient-ext' 'python2-os-virtual-interfacesv2-python-novaclient-ext')
pkgver=0.20
pkgrel=1
pkgdesc="Adds Virtual Interfaces support to python-novaclient"
arch=('any')
url="https://pypi.python.org/pypi/os_virtual_interfacesv2_python_novaclient_ext"
license=('GPL')
makedepends=('python2-setuptools' 'python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
md5sums=('a9512612f5ed0255321a416f65d81c23')


prepare() {
	cp -a "${_name}-${pkgver}"{,-py2}
}

build(){
	cd "${_name}-${pkgver}"
	python setup.py build

	cd "${_name}-${pkgver}"-py2
	python2 setup.py build
}

package_python-os-virtual-interfacesv2-python-novaclient-ext() {
	depends=('python-novaclient')
	cd "${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-os-virtual-interfacesv2-python-novaclient-ext() {
	depends=('python2-novaclient')
	cd "${_name}-${pkgver}"-py2
	python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
