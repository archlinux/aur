# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=sass
pkgver=1.3.8
pkgrel=2
license=('MIT')
pkgdesc='A featureful z80 assembler'
depends=("mono")
arch=("i386" "x86_64")
url='https://github.com/KnightOS/sass'
source=("https://github.com/KnightOS/sass/archive/${pkgver}.tar.gz")
sha1sums=('06687b27aae8e30e19b7aea8d735d7070251bc3b')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make install DESTDIR="$pkgdir/usr" PREFIX="/usr"
}
