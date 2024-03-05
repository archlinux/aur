# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Max Roder <maxroder@web.de>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=grml-rescueboot
pkgver=0.6.1
pkgrel=1
pkgdesc="grub2 script to add grml iso images to the grub2 boot menu"
url="http://wiki.grml.org/doku.php?id=rescueboot"
arch=(any)
license=(GPL-2.0-or-later)
depends=(grub)
install=grml-rescueboot.install
backup=(etc/default/grml-rescueboot)
source=("http://deb.grml.org/pool/main/g/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('14307b9a2b8294bdbf448b8a3aeddc9b11c7d9a55ebedfc20c8eea04746162e3')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 42_grml ${pkgdir}/etc/grub.d/42_grml
	install -Dm644 etc/default/${pkgname} ${pkgdir}/etc/default/${pkgname}
	install -d ${pkgdir}/boot/grml
}
