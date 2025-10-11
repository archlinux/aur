# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=eigenwallet-developertools-bin
_pkgver="3.1.3"
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
	"https://github.com/eigenwallet/core/releases/download/${_pkgver}/rendezvous-server_${_pkgver}_Linux_x86_64.tar"
)
sha256sums=('19f0c6a2acf4d6839dcd2c5ecb632b91fc1b1873edf651e632a9ef46e1622412'
            'abcc688b99ad5fed20edc47518fe3c818898c4c535de2fc5f0d137dab403d733'
            '84e881d3017f183579cebccb12e98f4a3daf81bac0ea3ea44716d7f8bf7b7d5c'
            '0daf3a95270535e13cb5b7de26e8725fe66c260dcd6a36b9895394d7ccfb069b'
            'e129a0c8846fa170f63141c6b1dd4e721f2f384e60c54a68a3f019f9e468ea08')
validpgpkeys=()

prepare() {
	printf "%b" "\n------------------------------------------------------------------------\nInstalled \e[1;34masb\e[0m, \e[1;34masb-controller\e[0m, \e[1;34mswap\e[0m, \e[1;34morchestrator\e[0m, and \e[1;34mrendezvous-server\e[0m\n------------------------------------------------------------------------\n"
}

package() {
  install -Dm755 "${srcdir}/asb" "$pkgdir/usr/bin/asb"
  install -Dm755 "${srcdir}/asb-controller" "$pkgdir/usr/bin/asb-controller"
  install -Dm755 "${srcdir}/swap" "$pkgdir/usr/bin/swap"
  install -Dm755 "${srcdir}/orchestrator" "$pkgdir/usr/bin/orchestrator"
  install -Dm755 "${srcdir}/rendezvous-server" "$pkgdir/usr/bin/rendezvous-server"
}
