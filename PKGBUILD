# Maintainer: James An <james@jamesan.ca>
# Contributor: kozec <kozec at kozec dot com>

pkgname="leapcast-git"
pkgdesc="ChromeCast emulation app for any device"
pkgver=0.1.3.10.g6142d0a
pkgrel=1
url='https://github.com/dz0ny/leapcast'
license=('MIT')
arch=('any')
makedepends=('git' 'python-distribute')
depends=('python2-tornado' 'python2-requests' 'python2-setuptools' 'twisted')
provides=('leapcast=0.0.1')
conflicts=('leapcast')
source=("git+https://github.com/dz0ny/leapcast")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/leapcast"
	git describe --always --long --tag | sed 's|-|.|g'
}

prepare() {
	true
}

package() {
	cd "${srcdir}/leapcast"
	python2.7 setup.py install --root="${pkgdir}" --optimize=1
}
