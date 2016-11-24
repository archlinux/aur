# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>

pkgname=zerofree
pkgver=1.0.4
pkgrel=1
pkgdesc='Scans for non-zero free blocks in an ext2 filesystem and fills them with zeroes'
arch=('i686' 'x86_64')
url='https://frippery.org/uml/'
license=('GPL')
depends=('e2fsprogs')
source=("https://frippery.org/uml/${pkgname}-${pkgver}.tgz")
sha256sums=('a7f9e293961eb653df55cf54774f2036924f31019814ead5554c393eecae6838')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -D -m0755 zerofree ${pkgdir}/usr/bin/zerofree
	install -D -m0755 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
