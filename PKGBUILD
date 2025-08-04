# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=eigenwallet-developertools-bin
_pkgver=3.0.0
pkgver=${_pkgver/-/.}
pkgrel=7
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
provides=(eigenwallet-developertools asb swap)
backup=()
options=()
# Usually _pkgver
pkgrelease=("${_pkgver}-beta.5")
source=(
	"https://github.com/eigenwallet/core/releases/download/${pkgrelease}/swap_${pkgrelease}_Linux_x86_64.tar"
	"https://github.com/eigenwallet/core/releases/download/${pkgrelease}/asb_${pkgrelease}_Linux_x86_64.tar"
)
sha256sums=('9a5e47c47635bb46b4a0bd964bd4aa270095787381e3c8b349cc2687a2f23fed'
            'd1f740d5d31c22d1a9e364b0a18266352a4dc3c33272908277adce21e5f87699')
validpgpkeys=()

prepare() {
	printf "%b" "\n----------------------\nInstalled \e[1;34masb\e[0m and \e[1;34mswap\e[0m\n----------------------\n"
}

package() {
  install -Dm755 "${srcdir}/asb" "$pkgdir/usr/bin/asb"
  install -Dm755 "${srcdir}/swap" "$pkgdir/usr/bin/swap" 
}
