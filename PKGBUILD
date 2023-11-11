# Maintainer: Riderius <riderius.help@gmail.com>

pkgname=dict-dalf
pkgver=1.0
pkgrel=1
pkgdesc="Dal's Russian Dictionary"
arch=('any')
license=('unknown')
optdepends=('dictd: dict client and server')
provides=('dictd-dalf')
conflicts=('dictd-dalf')
# Install file from dict-gcide (https://aur.archlinux.org/cgit/aur.git/tree/dict-gcide.install?h=dict-gcide)
install="${pkgname}.install"
source=("https://git.altlinux.org/tasks/139776/build/100/x86_64/rpms/dict-dalf-0.1-alt2.noarch.rpm")
sha512sums=('e8bcd66da3d8b097cd0197e1d3366506be26ea84cd2276053a675d10b2d23f6865f75287dc6a7c15bbaf902ec8eed8b6eaaafb4bdd1f79ff52868e515517108f')

package() {
	cd "${srcdir}/usr/share/dictd"
	install -m 0755 -d "${pkgdir}/usr/share/dictd"
	install -m 0644 -t "${pkgdir}/usr/share/dictd/" dalf.{dict.dz,index}
}
