# Maintainer: Ben Aaron Golberg <ben@benaaron.dev>

pkgname=geticons
pkgver=1.1.0
pkgrel=1
pkgdesc="CLI tool to get icons on Linux and other Freedesktop systems"
arch=('x86_64')
makedepends=('cargo')
depends=('bash' 'icons-in-terminal')
url="https://git.sr.ht/~zethra/geticons"
license=('GPL')
source=("https://git.sr.ht/~zethra/geticons/archive/${pkgver}.tar.gz")
sha256sums=('6a099067a138a8e5406d21a28f69554bd99326256576b0280246540419e73ced')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 geticons "${pkgdir}/usr/bin/geticons"
	install -Dm644 geticons.1 "$pkgdir/usr/share/man/man1/geticons.1"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/geticons/" LICENSE
}
