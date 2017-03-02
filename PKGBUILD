# Maintainer: Andreas Bosch <admin@progandy.de>
pkgname=iucode-tool
pkgver=2.1.2
pkgrel=1
pkgdesc="Tool to manipulate Intel® IA-32/X86-64 microcode bundles"
arch=(x86_64 i686)
url="https://gitlab.com/iucode-tool/iucode-tool/wikis/home"
license=('GPL')
makedepends=()
source=("https://gitlab.com/iucode-tool/releases/raw/master/${pkgname}_${pkgver}.tar.xz"
    "https://gitlab.com/iucode-tool/releases/raw/master/${pkgname}_${pkgver}.tar.xz.asc")
noextract=()
sha256sums=('01f1c02ba6935e0ac8440fb594c2ef57ce4437fcbce539e3ef329f55a6fd71ab'
            'SKIP')
validpgpkeys=('C467A717507BBAFED3C160920BD9E81139CB4807') # Henrique de Moraes Holschuh <hmh@hmh.eng.br>

build() {
	cd "$srcdir/${pkgname}-$pkgver"
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "$srcdir/${pkgname}-$pkgver"
	make DESTDIR="$pkgdir/" install
}
