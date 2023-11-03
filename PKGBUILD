# Maintainer: William Edwards <shadowapex@gmail.com>
pkgname=powerstation-git
_pkgbase=powerstation
pkgver=v0.1.1.r1.geaa1eb7
pkgrel=1
pkgdesc="Open source performance daemon with DBus interface"
arch=('x86_64')
url="https://github.com/ShadowBlip/PowerStation"
license=('GPL')
depends=('dbus')
makedepends=('rust' 'make' 'cmake'  'clang15')
provides=('powerstation')
conflicts=('powerstation-bin')
source=("${_pkgbase}::git+https://github.com/ShadowBlip/${_pkgbase}.git")

sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgbase}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${_pkgbase}"
}

build() {
	cd "$srcdir/${_pkgbase}"
	make build
}

package() {
	cd "$srcdir/${_pkgbase}"
	make install PREFIX=${pkgdir}/usr NO_RELOAD=true
}
