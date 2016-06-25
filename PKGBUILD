# Maintainer: brent s. <bts (at) square-r00t (dot) net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')

pkgname=swatd-git
pkgver=1
pkgrel=4
pkgdesc="A daemon for running scripts when a sensor is triggered"
arch=('any')
url="https://github.com/defuse/swatd"
license=('GPL3')
depends=('')
makedepends=('git')
source=('git+https://github.com/defuse/swatd.git'
	'swatd.service'
	'swatd.service.sig')
sha512sums=('SKIP'
            '5b7822403169ebd148316ce1ca5fa0f87ee0551189f077890812c28a1eac6df934a721a89b190aeb1896fa406452fda067682d258264fbfb8931fd892afd9410'
            'SKIP')

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
