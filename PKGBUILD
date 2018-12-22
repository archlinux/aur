# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=detect-it-easy
pkgver=2.01
pkgrel=1
pkgdesc="Detect It Easy is a packer identifier"
arch=(x86_64)
url="http://ntinfo.biz/index.html"
license=(custom)
depends=(glibc)
source=("https://github.com/horsicq/DIE-engine/releases/download/${pkgver}/die_lin64_portable_${pkgver}.tar.gz")
install="$pkgname.install"
sha256sums=('9fa3ea45c548bbcbfc651ab62e7cb9dce59f130d1d304143acb2cc53d94e3418')

package() {
	mkdir -p "$pkgdir/usr/share/detect-it-easy" "$pkgdir/usr/bin"

	cp -a "${srcdir}/die_lin64_portable/stuff" "$pkgdir/usr/share/detect-it-easy/"

	cp -a "${srcdir}/die_lin64_portable/die.sh" \
		"${srcdir}/die_lin64_portable/diec.sh" \
		"${srcdir}/die_lin64_portable/diel.sh" "$pkgdir/usr/bin/"

	sed -i -re 's|\$here|/usr/share/detect-it-easy|g' "${pkgdir}"/usr/bin/*.sh
}
