# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=eigenwallet-developertools-bin
_pkgver="3.0.1"
pkgver=${_pkgver/-beta./.}
pkgrel=1
epoch=
pkgdesc="λ eigenwallet developer tools are command-line tools for debugging purposes or to run a a maker (to provide liquidity) for eigenwallet's XMR<>BTC atomic swaps"
arch=('x86_64')
url="https://eigenwallet.org/"
license=('GPL-3.0')
groups=()
depends=(glib2)
optdepends=(
	'monero: monero node for abs'
	'electrs: bitcoin indexer for abs'
	'bitcoin-daemon: bitcoin node for electrs for abs'
)
provides=(eigenwallet-developertools asb asb-controller swap)
backup=()
options=()
source=(
	"https://github.com/eigenwallet/core/releases/download/${_pkgver}/swap_${_pkgver}_Linux_x86_64.tar"
	"https://github.com/eigenwallet/core/releases/download/${_pkgver}/asb_${_pkgver}_Linux_x86_64.tar"
	"https://github.com/eigenwallet/core/releases/download/${_pkgver}/asb-controller_${_pkgver}_Linux_x86_64.tar"
	"https://github.com/eigenwallet/core/releases/download/${_pkgver}/orchestrator_${_pkgver}_Linux_x86_64.tar"
)
sha256sums=('e1a478a5a5c70228f289f766be78f037dd558254004276b8ec3647b558093253'
            '539fb4b9509ebf03b6125c87ff6e9f36998af0aa22949a8eb623396858ddcf09'
            '79f9e25066a78333a0c329e5f4553a8fc9089c1ebda6839cd1620b46e7b4ffec'
            '3594aef3c8bc5c7ea760ca496b337f9c71431c07d7338a6a82638aa16efa583e')
validpgpkeys=()

prepare() {
	printf "%b" "\n------------------------------------------------------\nInstalled \e[1;34masb\e[0m, \e[1;34masb-controller\e[0m, \e[1;34mswap\e[0m, and \e[1;34morchestrator\e[0m\n------------------------------------------------------\n"
}

package() {
  install -Dm755 "${srcdir}/asb" "$pkgdir/usr/bin/asb"
  install -Dm755 "${srcdir}/asb-controller" "$pkgdir/usr/bin/asb-controller"
  install -Dm755 "${srcdir}/swap" "$pkgdir/usr/bin/swap"
  install -Dm755 "${srcdir}/orchestrator" "$pkgdir/usr/bin/orchestrator"
}
