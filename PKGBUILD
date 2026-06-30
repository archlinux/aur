# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=eigenwallet-developertools-bin
_pkgver="4.11.3"
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
sha256sums=('75b228d0ab346b9cffd3c9250aae9e9adab872b4d4d03754ad478927490b8634'
            '031b07ace1c22353915428ad7cb3dc31d093d9644905e4df5fd9551308332a29'
            '1075bf79d459388fdc207e43c8429d54bd08f72b342b3c7e0ecdfa5888d8bcb1'
            '3793530df8119a8933f21a598fb40fac94ace03bd7bd9de207a4586e9f95f011'
            'aa95ba5140d769ba4175cc5302ea1d443f730f6abf7c377fcbd89f6ea854c4f4')
validpgpkeys=()
install="$pkgname.install"

package() {
  install -Dm755 "${srcdir}/asb" "$pkgdir/usr/bin/asb"
  install -Dm755 "${srcdir}/asb-controller" "$pkgdir/usr/bin/asb-controller"
  install -Dm755 "${srcdir}/swap" "$pkgdir/usr/bin/swap"
  install -Dm755 "${srcdir}/orchestrator" "$pkgdir/usr/bin/orchestrator"
  install -Dm755 "${srcdir}/rendezvous-node" "$pkgdir/usr/bin/rendezvous-node"
}
