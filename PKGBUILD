# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=ncspot-bin
_pkgname=ncspot
pkgver=1.3.4
pkgrel=1
pkgdesc="Cross-platform ncurses Spotify client written in Rust, inspired by ncmpc and the likes"
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
sha512sums=('804caa909855aa29612f542a72449882c19468e5d07c181914b76fef7e5cdae7c11a002da21aafb562000dedc5d26a6f5683cb04a2712756c06dc3dbad78a414'
            '5704429acf132bc3d66071eb9d5b3ba82e3cc960fb691a786fe8c0ce1526e4fb4a1ce36059501c9c37eca8d47ba67dfd0d0d4c673f7dfbb15f486a93a2c91bdf')

package() {
	cd "$srcdir"

	install -Dm 755 $_pkgname		"${pkgdir}/usr/bin/${_pkgname}"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
