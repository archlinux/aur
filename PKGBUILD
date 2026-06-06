# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=eigenwallet-developertools-bin
_pkgver="4.8.1"
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
sha256sums=('7fb6d6b15dac8e803a2e6d9f5fc37b4feb7a28f6fd9985d193a0790a57b66cca'
            '4c1063bacaa809686aa9f22e4db46ad5703d9dac5a503f2979f67f311e841832'
            'e503c5272236cf41fab2fbaeac890612f932d9a5a204e37bba4229cbfe7f9a3b'
            '41c299b4b7883590fe9ee193f0b9f202db4753669a39e2e7fb45fb9d6e94c1a4'
            'c9dbae16501c03b3ed9386c4d4caa15d90ec3705f0d6b3aa3fae6b5ed9123ab4')
validpgpkeys=()
install="$pkgname.install"

package() {
  install -Dm755 "${srcdir}/asb" "$pkgdir/usr/bin/asb"
  install -Dm755 "${srcdir}/asb-controller" "$pkgdir/usr/bin/asb-controller"
  install -Dm755 "${srcdir}/swap" "$pkgdir/usr/bin/swap"
  install -Dm755 "${srcdir}/orchestrator" "$pkgdir/usr/bin/orchestrator"
  install -Dm755 "${srcdir}/rendezvous-node" "$pkgdir/usr/bin/rendezvous-node"
}
