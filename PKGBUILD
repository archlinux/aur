# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=eigenwallet-developertools-bin
_pkgver="4.9.1"
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
sha256sums=('3afb4bd6b4347e6dba25e373f50f3e5d2f5a97bb05806b4794190afe4216466b'
            '6d0f36edd916e09743bac2807aa5202c7a9a8a4e971b1fcb959a8de18aecc1a6'
            '2f6c8ca20a15240c2f858ff5cd009f8e22fa8703cf7567c1d671e773d7ce3700'
            '4a2efc74bcb54c293fe7e166293d6be1f67b671c20bca01a67b36b58a3b7a258'
            '5526b6686fc1d8d2f825061ce75104c1a0a4a8cdda9da84de0f58c1c39bdcab6')
validpgpkeys=()
install="$pkgname.install"

package() {
  install -Dm755 "${srcdir}/asb" "$pkgdir/usr/bin/asb"
  install -Dm755 "${srcdir}/asb-controller" "$pkgdir/usr/bin/asb-controller"
  install -Dm755 "${srcdir}/swap" "$pkgdir/usr/bin/swap"
  install -Dm755 "${srcdir}/orchestrator" "$pkgdir/usr/bin/orchestrator"
  install -Dm755 "${srcdir}/rendezvous-node" "$pkgdir/usr/bin/rendezvous-node"
}
