# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=z80ex
pkgver=1.1.21
pkgrel=1
pkgdesc="ZILOG Z80 CPU emulation library"
arch=('x86_64')
url="https://sourceforge.net/projects/z80ex/"
license=('GPL2')
source=("https://github.com/lipro/z80ex/archive/z80ex-1.1.21.tar.gz"
        "z80ex-z80ex-1.1.21-destdir.patch")
sha512sums=('94933089c9c21c979eba292b515ba19cc33f27af05b6f8adc42b921d6794be17dca05e612ce3512e46d9a949e0bbe7f96e11ca1a3b6a39287138477afd903830'
            '8c939bf0d51690ebee33932250d55ccb0353c9385eb2a9a882cee2e7f24b127faa44f8f1cadc6e92d60fcf3d830714bede607028b285d62db637aea8128ffddd')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"

	patch -Np1 -i "$srcdir/z80ex-z80ex-1.1.21-destdir.patch"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"

	make CFLAGS="${CFLAGS}"
}

package(){
	cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"

	make INSTALL_PREFIX=/usr DESTDIR="${pkgdir}" install
}

