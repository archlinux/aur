# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=detect-it-easy
pkgver=3.01
pkgrel=1
pkgdesc="Detect It Easy is a packer identifier"
arch=(x86_64)
url="http://ntinfo.biz/index.html"
license=(custom)
depends=(glibc)
source=("https://github.com/horsicq/DIE-engine/releases/download/${pkgver}/die_lin64_portable_${pkgver}.tar.gz")
install="$pkgname.install"
sha256sums=('65e8881ce8bc14d376d909976f739e0cd9ca0ad846906518e0297dbb56f62662')

package() {
	install -dm755 "$pkgdir/usr/share/detect-it-easy"
	cp -a "${srcdir}/die_lin64_portable/base" "$pkgdir/usr/share/detect-it-easy/"

	install -Dm755 "${srcdir}/die_lin64_portable/die.sh" "${pkgdir}/usr/bin/die.sh"
	install -Dm755 "${srcdir}/die_lin64_portable/diec.sh" "${pkgdir}/usr/bin/diec.sh"
}
