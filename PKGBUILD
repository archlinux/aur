# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgbase=python-pykickstart
pkgname=(python-pykickstart python2-pykickstart)
pkgver=2.14
_tag=r${pkgver}-1
pkgrel=1
pkgdesc='a python library that is used for reading and writing kickstart files'
arch=(any)
license=(GPL)
url='http://fedoraproject.org/wiki/Pykickstart'
makedepends=(python python2 urlgrabber)
source=("pykickstart-${pkgver}.tar.gz::https://github.com/rhinstaller/pykickstart/archive/${_tag}.tar.gz")
sha256sums=('cc6cf7b900474bd315484d77c8085f45dcebc96dad65fa0a2771e1a1c863cca8')

package_python-pykickstart() {
	pkgdesc='a python library that is used for reading and writing kickstart files - python 3.x pkg'
	depends=('python' 'python-requests' 'urlgrabber')

	cd pykickstart-${_tag}

	python3 setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-pykickstart() {
	pkgdesc='a python library that is used for reading and writing kickstart files - python 2.x pkg'
	depends=('python2' 'python2-requests' 'urlgrabber')

	cd pykickstart-${_tag}

	python2 setup.py install --root="${pkgdir}" --optimize=1
}

