# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=eigenwallet-developertools-bin
_pkgver=3.0.0
pkgver=${_pkgver/-/.}
pkgrel=1
epoch=
pkgdesc="λ eigenwallet developer tools are command-line tools for debugging purposes or to run a a maker (to provide liquidity) for eigenwallet's XMR<>BTC atomic swaps"
arch=('x86_64')
url="https://eigenwallet.org/"
license=('GPL-3.0')
groups=()
depends=(glib2)
provides=(eigenwallet-developertools)
backup=()
options=()
# Usually _pkgver
pkgrelease=("${_pkgver}-beta")
source=(
	"https://github.com/eigenwallet/core/releases/download/${pkgrelease}/swap_${pkgrelease}_Linux_x86_64.tar"
	"https://github.com/eigenwallet/core/releases/download/${pkgrelease}/asb_${pkgrelease}_Linux_x86_64.tar"
)
sha256sums=('923e55e5e9d4e8e618f8c2aa8b30c46e656434f04075482b8af4fd38359fa96b'
            'ab24b461e2b5908a6f8dddfec50654f36a38ab4d593353747923c4616b36769b')
validpgpkeys=()

package() {
  install -Dm755 "${srcdir}/asb" "$pkgdir/usr/bin/asb"
  install -Dm755 "${srcdir}/swap" "$pkgdir/usr/bin/swap" 
}


post_install() {
	printf "%b" "\n----------------------\nInstalled \e[1;34masb\e[0m and \e[1;34mswap\e[0m\n----------------------\n"
}
