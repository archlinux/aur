# Maintainer: Troy C < rstrox -ta yahoo -tod com >

pkgname=('python-rackspace-novaclient' ) #'python2-rackspace-novaclient')
pkgver=1.4
pkgrel=3
pkgdesc="Metapackage to install python-novaclient and Rackspace extensions"
arch=('any')
url="http://pypi.python.org/pypi/rackspace-novaclient/"
license=('GPL')
depends=('python-rax-scheduled-images-python-novaclient-ext' 'python-rax-backup-schedule-python-novaclient-ext' 'python-rax-default-network-flags-python-novaclient-ext' 'python-os-networksv2-python-novaclient-ext' 'python-rackspace-auth-openstack' 'python-os-diskconfig-python-novaclient-ext')
makedepends=('python-setuptools')
provides=("$pkgname=$pkgver")
source=("http://pypi.python.org/packages/source/r/rackspace-novaclient/rackspace-novaclient-$pkgver.tar.gz")
md5sums=('8cd0c5293511ad68bed3594cd4db276f')

build() {
	cd "$srcdir/rackspace-novaclient-${pkgver}"
	python setup.py build || return 1
#	python2 setup.py build || return 1
}

package_python-rackspace-novaclient() {
	cd "$srcdir/rackspace-novaclient-${pkgver}"
	python setup.py install --root=${pkgdir} || return 1
}

#package_python2-rackspace-novaclient() {
#	cd "$srcdir/rackspace-novaclient-${pkgver}"
#	python2 setup.py install --root=${pkgdir} || return 1
#}
