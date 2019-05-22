# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=detect-it-easy
pkgver=2.03
pkgrel=1
pkgdesc="Detect It Easy is a packer identifier"
arch=(x86_64)
url="http://ntinfo.biz/index.html"
license=(custom)
depends=(glibc)
source=("https://github.com/horsicq/DIE-engine/releases/download/${pkgver}/die_lin64_portable_${pkgver}.tar.gz")
install="$pkgname.install"
sha256sums=('2984ef1e66b39ad80bc12c9ca119af7cf4c02624dd628ac204698b056bdef83c')

package() {
	install -dm755 "$pkgdir/usr/share/detect-it-easy"
	cp -a "${srcdir}/die_lin64_portable/base" "$pkgdir/usr/share/detect-it-easy/"

	install -Dm755 "${srcdir}/die_lin64_portable/die.sh" "${pkgdir}/usr/bin/die.sh"
	install -Dm755 "${srcdir}/die_lin64_portable/diec.sh" "${pkgdir}/usr/bin/diec.sh"
	install -Dm755 "${srcdir}/die_lin64_portable/diel.sh" "${pkgdir}/usr/bin/diel.sh"

	sed -i -re 's|\$here|/usr/share/detect-it-easy|g' "${pkgdir}/usr/bin/die"*.sh
}
