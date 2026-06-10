# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=eigenwallet-developertools-bin
_pkgver="4.9.0"
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
sha256sums=('659554f96be04a5819a88a9d2294345510bd1098f7cf55d54c1990078a359fa4'
            'a9fa3ed9e812e1f41e4ffdf517abc17d9ca5eee2a2ac903a6eff76c64f0a6960'
            '30921aad9509c76d2af050228e1132577d4dabc3c3c3dc0456c4f0d503bab3a9'
            '4cd36346bcd18c164383f583b1686bae0f6c35a1b43e23b8603e0b2a1273d2d8'
            'f0f2fd0cebf41e2505829f22b9a0620d8138308f0d84d68f22bcf2d0df38e384')
validpgpkeys=()
install="$pkgname.install"

package() {
  install -Dm755 "${srcdir}/asb" "$pkgdir/usr/bin/asb"
  install -Dm755 "${srcdir}/asb-controller" "$pkgdir/usr/bin/asb-controller"
  install -Dm755 "${srcdir}/swap" "$pkgdir/usr/bin/swap"
  install -Dm755 "${srcdir}/orchestrator" "$pkgdir/usr/bin/orchestrator"
  install -Dm755 "${srcdir}/rendezvous-node" "$pkgdir/usr/bin/rendezvous-node"
}
