# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=eigenwallet-developertools-bin
_pkgver=3.0.0
pkgver=${_pkgver/-/.}
pkgrel=5
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
pkgrelease=("${_pkgver}-beta.3")
source=(
	"https://github.com/eigenwallet/core/releases/download/${pkgrelease}/swap_${pkgrelease}_Linux_x86_64.tar"
	"https://github.com/eigenwallet/core/releases/download/${pkgrelease}/asb_${pkgrelease}_Linux_x86_64.tar"
)
sha256sums=('3ed91d10d84bd9d42f66023e9dae1a92618c11a93f219dfa211ea56700a6a457'
            '1d975de8146c5dba8dffbdefb13067863eb87476720bcf1738b2de905e9f7ea4')
validpgpkeys=()

prepare() {
	printf "%b" "\n----------------------\nInstalled \e[1;34masb\e[0m and \e[1;34mswap\e[0m\n----------------------\n"
}

package() {
  install -Dm755 "${srcdir}/asb" "$pkgdir/usr/bin/asb"
  install -Dm755 "${srcdir}/swap" "$pkgdir/usr/bin/swap" 
}
