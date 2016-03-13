# Maintainer: Viech <viech unvanquished net>

pkgname="netradiant-unvanquished-git"
pkgver=v0.0.0.76.ge95f250
pkgrel=1
pkgdesc="Adds support for the game Unvanquished to the level editor Netradiant."
arch=("any")
url="https://unvanquished.net"
license=("unknown")
depends=("netradiant" "unvanquished")
makedepends=("git")
conflicts=("netradiant-unvanquished")
provides=("netradiant-unvanquished")

source=("git::git+https://github.com/Unvanquished/mapeditor-support.git")

pkgver() {
	cd "${srcdir}/git"

	local ver="$(git describe --match "v*")"
	printf "%s" "${ver//-/.}"
}

package() {
	install -dm755 ${pkgdir}/opt/netradiant/games \
	               ${pkgdir}/opt/netradiant/unvanquished.game/pkg

	cd "${srcdir}/git/netradiant/gamepack"

	install -m 644 games/unvanquished.game                      ${pkgdir}/opt/netradiant/games/
	install -m 644 unvanquished.game/default_build_menu.xml     ${pkgdir}/opt/netradiant/unvanquished.game/
	install -m 644 unvanquished.game/game.xlink                 ${pkgdir}/opt/netradiant/unvanquished.game/
	install -m 644 unvanquished.game/pkg/entities.def           ${pkgdir}/opt/netradiant/unvanquished.game/pkg/
}

md5sums=('SKIP')
