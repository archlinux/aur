# Maintainer: FirstAirBender <noblechuk5 [at] web [dot] de>

pkgname=unbound-root-hints
pkgver=v1.0.0
pkgrel=1
pkgdesc='Update root hints for unbound'
arch=('any')
url='https://wiki.archlinux.org/index.php/unbound#Roothints_systemd_timer'
optdepends=('unbound')
depends=('systemd')
source=(
	"roothints.service"
	"roothints.timer"
)
sha256sums=(
	'b786d36d17b352213058b0743bc03df810348ef59b7a5c9e03d41b7804d0570b'
	'a2ffa7038b3f8eb537a6fcd56ffa3f7392dbad9a8b6333edfbcc67e124320aff'
)
package() {
	install --mode=755 --directory "$pkgdir/usr/lib/systemd/system"
	install -D --mode=644 roothints.{service,timer} "$pkgdir/usr/lib/systemd/system"
}

# https://jlk.fjfi.cvut.cz/arch/manpages/man/PKGBUILD
