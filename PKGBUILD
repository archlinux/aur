# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=eigenwallet-developertools-bin
_pkgver=3.0.0
pkgver=${_pkgver/-/.}
pkgrel=6
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
pkgrelease=("${_pkgver}-beta.4")
source=(
	"https://github.com/eigenwallet/core/releases/download/${pkgrelease}/swap_${pkgrelease}_Linux_x86_64.tar"
	"https://github.com/eigenwallet/core/releases/download/${pkgrelease}/asb_${pkgrelease}_Linux_x86_64.tar"
)
sha256sums=('c70f280ca38feba6b764e659ce470fac5dfc251ba7756c9a99822a7d6ae27f43'
            'ebcbe99afee03914f15357dd9cedcc32f7a8a2a73cbf3c29e68350e2c56fe3fe')
validpgpkeys=()

prepare() {
	printf "%b" "\n----------------------\nInstalled \e[1;34masb\e[0m and \e[1;34mswap\e[0m\n----------------------\n"
}

package() {
  install -Dm755 "${srcdir}/asb" "$pkgdir/usr/bin/asb"
  install -Dm755 "${srcdir}/swap" "$pkgdir/usr/bin/swap" 
}
