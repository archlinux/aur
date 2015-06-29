# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=python2-blivet
pkgver=0.75
_tag="blivet-${pkgver}"
pkgrel=2
pkgdesc='a python module for management of a system storage configuration'
arch=('any')
license=('LGPL2.1')
url='http://fedoraproject.org/wiki/Blivet'
depends=('python2' 'python2-six' 'python2-pyparted' 'python2-pykickstart'
	'python2-pyblock' 'python2-cryptsetup' 'python2-pyudev'
	'multipath-tools' 'mdadm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dwlehman/blivet/archive/${_tag}.tar.gz")
sha256sums=('731fffd8d2a59d08f140e863c1cb6e2c514fe54646be7f63621844e67acb0015')

package() {
	cd "${srcdir}/blivet-${_tag}/"

	python2 setup.py install --root="${pkgdir}/" --optimize=1
}

check() {
	cd "${srcdir}/blivet-${_tag}/"

	python2 setup.py check
}

