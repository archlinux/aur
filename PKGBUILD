# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgdesc='Desktop Environment for the Arcan display server'
pkgname='durden-git'
pkgver=0.2.r118.g716e753
pkgrel=1
license=('GPL2' 'LGPL' 'custom:BSD')
arch=('x86_64')
depends=('arcan')
url='http://durden.arcan-fe.com/'
source=("${pkgname}::git+https://github.com/letoram/durden.git")
sha512sums=('SKIP')

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	:
}

package () {
	cd "${pkgname}"
	install -dm755 "${pkgdir}/usr/share"
	cp -a durden "${pkgdir}/usr/share"
}
