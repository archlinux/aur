# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=openrtm-aist-python
pkgver=1.0.0
pkgrel=1
pkgdesc="Python bindings for OpenRTM-aist"
arch=('i686' 'x86_64')
url="http://www.openrtm.org"
license=('GPL')
depends=('omniorb' 'python')
source=(http://www.openrtm.org/pub/OpenRTM-aist/python/1.0.0/OpenRTM-aist-Python-${pkgver}-RELEASE.tar.gz)
md5sums=('dd11ef6a2e6277fa095e0fbd3210a2a5')

build() {
	cd ${srcdir}/OpenRTM-aist-Python-${pkgver}
	
	sed 's/-bpython/-p -bpython/g' -i setup.py
	
	python setup.py sdist
	python setup.py build
}

package() {
	cd ${srcdir}/OpenRTM-aist-Python-${pkgver}
	
	python setup.py install --root=${pkgdir} --optimize=1
}

