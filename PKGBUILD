# Maintainer: Andreas Bosch <admin@progandy.de>
pkgname=iucode-tool
pkgver=1.5
pkgrel=1
pkgdesc="Tool to manipulate Intel® IA-32/X86-64 microcode bundles"
arch=(x86_64 i686)
url="https://gitlab.com/iucode-tool/iucode-tool/wikis/home"
license=('GPL')
makedepends=()
source=("https://gitlab.com/iucode-tool/releases/raw/master/${pkgname}_${pkgver}.tar.xz"
    "https://gitlab.com/iucode-tool/releases/raw/master/${pkgname}_${pkgver}.tar.xz.asc")
noextract=()
sha256sums=('33271652032f20f866a212bc98ea01a8db65c4ac839fa820aa23da974fd6ff62'
            'SKIP')
validpgpkeys=('C467A717507BBAFED3C160920BD9E81139CB4807') # Henrique de Moraes Holschuh <hmh@hmh.eng.br>

build() {
	cd "$srcdir/${pkgname/-/_}-$pkgver"
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "$srcdir/${pkgname/-/_}-$pkgver"
	make DESTDIR="$pkgdir/" install
}
