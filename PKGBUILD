# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Troy C < rstrox -ta yahoo -tod com >

_name=rackspace-novaclient
pkgname='python-rackspace-novaclient'
pkgver=2.1
pkgrel=1
pkgdesc="Metapackage to install python-novaclient and Rackspace extensions"
arch=('any')
url="http://pypi.python.org/pypi/rackspace-novaclient/"
license=('GPL')
depends=(
	 'python-novaclient'
	 'python-rackspace-auth-openstack'
	 'python-os-diskconfig-python-novaclient-ext'
	 'python-rax-scheduled-images-python-novaclient-ext'
	 'python-os-networksv2-python-novaclient-ext'
	 'python-os-virtual-interfacesv2-python-novaclient-ext'
	 'python-rax-default-network-flags-python-novaclient-ext'
	 )
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
md5sums=('4a1ba508270a14f196676d2ae8b3db93')


build() {
	cd "$_name-${pkgver}"
	python setup.py build
}

package() {
	cd "$_name-${pkgver}"
	python setup.py install --root=${pkgdir}
}
