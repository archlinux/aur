# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgbase=python-blivet
pkgname=(python-blivet python2-blivet)
pkgver=1.13
_tag="blivet-${pkgver}"
pkgrel=2
pkgdesc='a python module for management of a system storage configuration'
arch=('any')
license=('LGPL2.1')
url='http://fedoraproject.org/wiki/Blivet'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rhinstaller/blivet/archive/blivet-${pkgver}.tar.gz")
sha256sums=('c3700ef547e435c26accacca8b88bea1c171118251aeff41a5471e953d784d04')

package_python-blivet() {
	pkgdesc='a python module for management of a system storage configuration - python 3.x pkg'
	depends=('multipath-tools' 'mdadm' 'libblockdev' 'libselinux' 'python-six' 'python-pyudev' 'hawkey' 'python-pyparted' 'python-pykickstart')

	cd "${srcdir}/blivet-${_tag}/"

	python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-blivet() {
	pkgdesc='a python module for management of a system storage configuration - python 2.x pkg'
	depends=('multipath-tools' 'mdadm' 'libblockdev' 'libselinux' 'python2-six' 'python2-pyudev' 'hawkey' 'python2-pyparted' 'python2-pykickstart')

	cd "${srcdir}/blivet-${_tag}/"

	python2 setup.py install --root="${pkgdir}/" --optimize=1
}

