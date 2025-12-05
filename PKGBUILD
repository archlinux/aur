# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=eigenwallet-developertools-bin
_pkgver="3.5.0"
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
sha256sums=('88a2f99987aad2fcb4d6a237b7de3a49f75f209892b71f6dc1fc33d7d5ee4dca'
            '6ee1ff33989b1c50102a1d01ea652d73342f22a95043ad68e827de88565a4171'
            '37fd18425d5f2bc8e9327b258dbf1d34fa18d0174fc84590154f2ff5520a459a'
            'f676ffb7a5f4b17bf9d8fa0c35ffa4b224f73d9f902d37d5a217e53301c67abb'
            '06358bada22d6e5124c3092de7c8da18d901c8ed303a2bd0129fa5084c456092')
validpgpkeys=()
install="$pkgname.install"

package() {
  install -Dm755 "${srcdir}/asb" "$pkgdir/usr/bin/asb"
  install -Dm755 "${srcdir}/asb-controller" "$pkgdir/usr/bin/asb-controller"
  install -Dm755 "${srcdir}/swap" "$pkgdir/usr/bin/swap"
  install -Dm755 "${srcdir}/orchestrator" "$pkgdir/usr/bin/orchestrator"
  install -Dm755 "${srcdir}/rendezvous-node" "$pkgdir/usr/bin/rendezvous-node"
}
