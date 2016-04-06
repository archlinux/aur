# Maintainer: brent s. <bts (at) square-r00t (dot) net>
validpgpkeys=('7482 31EB CBD8 08A1 4F5E  85D2 8C00 4C2F 9348 1F6B')

pkgname=swatd-git
pkgver=1
pkgrel=3
pkgdesc="A daemon for running scripts when a sensor is triggered"
arch=('any')
url="https://github.com/defuse/swatd"
license=('GPL3')
depends=('')
makedepends=('git')
source=('git+https://github.com/defuse/swatd.git'
	'swatd.service')
sha512sums=('SKIP'
	'5b7822403169ebd148316ce1ca5fa0f87ee0551189f077890812c28a1eac6df934a721a89b190aeb1896fa406452fda067682d258264fbfb8931fd892afd9410')

build() {
	cd "${srcdir}"/swatd
	make
}

package(){

	cd "${pkgdir}"
	install -D -m 0755 "${srcdir}"/swatd/swatd usr/bin
	install -D -m 0640 "${srcdir}"/swatd/swatd.conf etc/swatd/swatd.conf
	install -D -m 0644 "${srcdir}"/swatd.service usr/lib/systemd/system
}
