# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=eigenwallet-developertools-bin
_pkgver="3.0.4"
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
sha256sums=('2cdeb57efea6815e03ea4c66ed5fb1c6a30bb073f488146b4b7013d63ad19b11'
            '4f47bfabcd6c13f080fef255e394559476bafa504ae9241a57bcfbe248efa788'
            '4cb10bad8707bea88db0ab323e34230c4f4926a9b73d9288befdb8e8b65107ee'
            'd7b1cdcfeee608a1a34ccd0e7ddfe18564f7179ff12716a271017ea0330ed85a')
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
