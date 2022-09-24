# Maintainer: Ben Aaron Golberg <ben@benaaron.dev>

pkgname=geticons
pkgver=1.2.2
pkgrel=1
pkgdesc="CLI tool to get icons on Linux and other Freedesktop systems"
arch=('x86_64')
makedepends=('cargo')
depends=('bash' 'icons-in-terminal')
url="https://git.sr.ht/~zethra/geticons"
license=('GPL')
source=("https://git.sr.ht/~zethra/geticons/archive/${pkgver}.tar.gz")
sha256sums=('06db43615711cb00de2eea9ee0b33823bf51f61e640fe99ad4bf7ec3bf99f41e')

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
