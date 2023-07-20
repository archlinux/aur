# Maintainer: Kristofers Solo <dev@kristofers.xyz>
_pkgname="tuxedo-control-center"
pkgname="${_pkgname}-runit"
pkgver=1
pkgrel=1
pkgdesc="runit service for TUXEDO Control Center "
arch=("x86_64")
url="https://aur.archlinux.org/packages/tuxedo-control-center-runit"
license=("GPL")
depends=("runit" "tuxedo-control-center-bin")
source=("tccd.run" "tccd.finish")
sha256sums=("f92a399d380b2e88207d59227395cf7315e015f24fee8dfe12c0b31ee89546f9" "f632f82b4287fe49216a9be2ad0fae62dedf9f37c823dea7eb1f8d18d8333617")

package() {
	cd "$pkgname"
	install -Dm755 ./tccd.run "${pkgdir}/etc/runit/sv/tccd/run"
	install -Dm755 ./tccd.finish "${pkgdir}/etc/runit/sv/tccd/finish"
}
