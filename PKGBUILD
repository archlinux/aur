# Maintainer: kozec <kozec at kozec dot com>

pkgname="leapcast-git"
pkgdesc="ChromeCast emulation app for any device"
pkgver=0.0.4.26.g19dc64f
pkgrel=1
url='https://github.com/dz0ny/leapcast'
license=('MIT')
arch=('any')
makedepends=('git' 'python-distribute')
depends=('python2-tornado' 'python2-requests' 'python2-setuptools' 'twisted')
provides=('leapcast=0.0.1')
conflicts=('leapcast')
source=("git://github.com/dz0ny/leapcast")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/leapcast"
	git describe --always | sed 's|-|.|g'
}

prepare() {
	true
}

package() {
	cd "${srcdir}/leapcast"
	python2.7 setup.py install --root="${pkgdir}" --optimize=1
}
