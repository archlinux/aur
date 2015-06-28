# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>

pkgname=zerofree
pkgver=1.0.3
pkgrel=3
pkgdesc='Scans for non-zero free blocks in an ext2 filesystem and fills them with zeroes'
arch=('i686' 'x86_64')
url='http://intgat.tigress.co.uk/rmy/uml/'
license=('GPL')
depends=('e2fsprogs')
source=("http://intgat.tigress.co.uk/rmy/uml/${pkgname}-${pkgver}.tgz")
sha256sums=('3acfda860be0f0ddcb5c982ff3b4475b1ee8cc35a90ae2a910e93261dbe0ccf6')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -D -m0755 zerofree ${pkgdir}/usr/bin/zerofree
	install -D -m0755 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
