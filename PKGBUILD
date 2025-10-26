# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=eigenwallet-developertools-bin
_pkgver="3.2.2"
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
sha256sums=('853d8081220fa9d7869ab6053a6366f77dcfc3c110ad0a7dd1a43c6947726b81'
            '71134d1cd5f2eb5d5d04433b161876afcaa8af277e5b62d902580297e4948a6b'
            '5ee2a9d2e31c4b4af689ff2584a6db6aedf64c0ba5225579a1f9295c25a07f42'
            'b286d0361cf7ea97fc0737f922fdc0265663b39af3adbc5a6ce21c2b4da1bb86'
            'de31603624c1450862af24a9c9d640fbed2b3e148b1afb1a4b750064b7e3de0f')
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
