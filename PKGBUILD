# Maintainer: Thomas Weißschuh <aur t-8ch de>

pkgname=poke-elf
url=https://www.jemarch.net/poke-elf.html
pkgdesc='ELF pickles for GNU poke'
pkgver=1.0
pkgrel=1
source=("https://ftp.gnu.org/gnu/poke/poke-elf-${pkgver}.tar.gz"
	"https://ftp.gnu.org/gnu/poke/poke-elf-${pkgver}.tar.gz.sig"
)
sha256sums=('0ab767dafc435454cc98b245fe45aa2178c7c85d7b16308a23434a7d60847a74'
            'SKIP')
arch=(any)
license=('GPL-3.0-only')
depends=(poke)
options=(!debug)

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure --prefix=/usr
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	# Only examples
	rm -r "${pkgdir}"/usr/bin
}
