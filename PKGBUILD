# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=detect-it-easy
pkgver=2.00
pkgrel=1
pkgdesc="Detect It Easy is a packer identifier"
arch=(x86_64)
url="http://ntinfo.biz/index.html"
license=(custom)
depends=(glibc)
source=("https://github.com/horsicq/DIE-engine/releases/download/2.00/die_lin64_portable_2.00.tar.gz")
install="$pkgname.install"
sha256sums=('027668b749985715b441277ebf9ac1c1bdf7ac26af8aa9ccc93325287f0b2214')

package() {
	mkdir -p "$pkgdir/usr/share/detect-it-easy" "$pkgdir/usr/bin"

	cp -a "${srcdir}/die_lin64_portable/stuff" "$pkgdir/usr/share/detect-it-easy/"

	cp -a "${srcdir}/die_lin64_portable/die.sh" \
		"${srcdir}/die_lin64_portable/diec.sh" \
		"${srcdir}/die_lin64_portable/diel.sh" "$pkgdir/usr/bin/"

	sed -i -re 's|\$here|/usr/share/detect-it-easy|g' "${pkgdir}"/usr/bin/*.sh
}
