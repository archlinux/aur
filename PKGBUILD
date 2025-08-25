# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=ncspot-bin
_pkgname=ncspot
pkgver=1.3.1
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
sha512sums=('3e2e613d785284ef7f652190ae2aa00aa69e25186ad17616c8fc0e7bdc9d5fec9b02a5d780a5050a1b83ed8ca5b581194a0da3c6bbcdc3b301640f6bf3fe6dc5'
            '5704429acf132bc3d66071eb9d5b3ba82e3cc960fb691a786fe8c0ce1526e4fb4a1ce36059501c9c37eca8d47ba67dfd0d0d4c673f7dfbb15f486a93a2c91bdf')

package() {
	cd "$srcdir"

	install -Dm 755 $_pkgname		"${pkgdir}/usr/bin/${_pkgname}"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
