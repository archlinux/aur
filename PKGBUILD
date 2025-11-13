# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=eigenwallet-developertools-bin
_pkgver="3.3.3"
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
	"https://github.com/eigenwallet/core/releases/download/${_pkgver}/rendezvous-node_${_pkgver}_Linux_x86_64.tar"
)
sha256sums=('737eab53369e1eb66362699f36b703520a16b57b5b2b6a9a77b7dc40553d34e5'
            'e628da9d8f897856a7419481a7250e260f809474e6dc84e4e8616bb1fcb031e9'
            '3767de7919a7b2b751bedb2c18f292922cc12952f855c36e8bb1fe78b908e092'
            'f2e5f7b7aecf4975d9d585d7e38195589799c1cb89c2347b2ac1ae69eab37108'
            '7dc6d09b56d0b0d8cab2bb2020c8673d4fe0d562b646037bc337f0488e28df7e')
validpgpkeys=()

prepare() {
	printf "%b" "\n----------------------------------------------------------------------\nInstalled \e[1;34masb\e[0m, \e[1;34masb-controller\e[0m, \e[1;34mswap\e[0m, \e[1;34morchestrator\e[0m, and \e[1;34mrendezvous-node\e[0m\n----------------------------------------------------------------------\n"
}

package() {
  install -Dm755 "${srcdir}/asb" "$pkgdir/usr/bin/asb"
  install -Dm755 "${srcdir}/asb-controller" "$pkgdir/usr/bin/asb-controller"
  install -Dm755 "${srcdir}/swap" "$pkgdir/usr/bin/swap"
  install -Dm755 "${srcdir}/orchestrator" "$pkgdir/usr/bin/orchestrator"
  install -Dm755 "${srcdir}/rendezvous-node" "$pkgdir/usr/bin/rendezvous-node"
}
