# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=ncspot-bin
_pkgname=ncspot
pkgver=1.3.2
pkgrel=1
pkgdesc="Cross-platform ncurses Spotify client written in Rust, inspired by ncmpc and the likes."
arch=('x86_64')
url="https://github.com/hrkfdn/ncspot"
license=('BSD-2-Clause')
provides=('ncspot')
conflicts=('ncspot' 'ncspot-git')
depends=('openssl' 'gcc-libs' 'glibc' 'libpulse')
optdepends=('ueberzug: album cover support')
source=(
	"${url}/releases/download/v${pkgver}/ncspot-v${pkgver}-linux-x86_64.tar.gz"
	"${url}/raw/main/LICENSE"
)
sha512sums=('841b35422c9b404455d4bdea642dbb7f40a2f7bd77de05930e735da68a7ce1de3d998ae20835e88dbe27674d2b6633b63b5c1bcf74e0e60d0217d7b39200f784'
            '5704429acf132bc3d66071eb9d5b3ba82e3cc960fb691a786fe8c0ce1526e4fb4a1ce36059501c9c37eca8d47ba67dfd0d0d4c673f7dfbb15f486a93a2c91bdf')

package() {
	cd "$srcdir"

	install -Dm 755 $_pkgname		"${pkgdir}/usr/bin/${_pkgname}"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
