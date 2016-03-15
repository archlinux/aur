# Maintainer: James An <james@jamesan.ca>
# Contributor: kozec <kozec at kozec dot com>

pkgname="leapcast-git"
_pkgname=${pkgname%-git}
pkgdesc="ChromeCast emulation app for any device"
pkgver=0.1.3.10.g6142d0a
pkgrel=2
url="https://github.com/dz0ny/$_pkgname"
license=('MIT')
arch=('any')
makedepends=('git' 'python-distribute')
depends=('python2-tornado' 'python2-requests' 'python2-setuptools' 'twisted')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname"::"git+https://github.com/dz0ny/$_pkgname")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --always --long --tag | sed 's|-|.|g'
}

prepare() {
	true
}

package() {
	cd "$_pkgname"
	python2.7 setup.py install --root="${pkgdir}" --optimize=1
}
