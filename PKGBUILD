# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Max Roder <maxroder@web.de>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=grml-rescueboot
pkgver=0.6.9
pkgrel=1
pkgdesc="grub2 script to add grml iso images to the grub2 boot menu"
url="http://wiki.grml.org/doku.php?id=rescueboot"
arch=(any)
license=(GPL-2.0-or-later)
depends=(grub)
install=grml-rescueboot.install
backup=(etc/default/grml-rescueboot)
source=("http://deb.grml.org/pool/main/g/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('4f0295be247a94d063b8a32ae42be44242cbd498c2880b71acb33ad6be9722c9')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 42_grml ${pkgdir}/etc/grub.d/42_grml
	install -Dm644 etc/default/${pkgname} ${pkgdir}/etc/default/${pkgname}
	install -d ${pkgdir}/boot/grml
}
