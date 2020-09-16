# Maintainer: FirstAirBender <noblechuk5 [at] web [dot] de>

pkgname=unbound-root-hints-updater
pkgver=1.0.2
pkgrel=1
pkgdesc="A systemd timer for updating unbound's root servers."
arch=('any')
url='https://gitlab.com/firstairbender/unbound-root-hints'
optdepends=(
	'systemd: the timer needs to be run by systemd'
)
depends=('unbound')
source=(
	"unbound-root-hints.service"
	"unbound-root-hints.timer"
)
sha256sums=(
	'b786d36d17b352213058b0743bc03df810348ef59b7a5c9e03d41b7804d0570b'
	'a2ffa7038b3f8eb537a6fcd56ffa3f7392dbad9a8b6333edfbcc67e124320aff'
)
package() {
	install --mode=755 --directory "$pkgdir/usr/lib/systemd/system"
	install -D --mode=644 * "$pkgdir/usr/lib/systemd/system"
}

# https://jlk.fjfi.cvut.cz/arch/manpages/man/PKGBUILD
