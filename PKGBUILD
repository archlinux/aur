# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=eigenwallet-developertools-bin
_pkgver="3.2.1"
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
sha256sums=('8da1dca2d98ea50800d4bfedf99ab78edb066efe835a4cb6dee5cffa5ec96673'
            '4560edcbb918c4b2dd9d8febfba008dfba465863a2e2440edd5a0d9b3b0693bd'
            '90a8b9a182ac002cb80e3304407522aa0b873a5c63a0e03fa9cebd1da5387e79'
            '1ad561f65c1c088889f6d405617c58c2547b4230020a6870ab582bbb75721299'
            'f2c73c711161a26c13180fb66109ba7deb0e347155186c457e2a7eafe5989a20')
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
