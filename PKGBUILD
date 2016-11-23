# Maintainer: Andreas Bosch <admin@progandy.de>
pkgname=iucode-tool
pkgver=2.1
pkgrel=1
pkgdesc="Tool to manipulate Intel® IA-32/X86-64 microcode bundles"
arch=(x86_64 i686)
url="https://gitlab.com/iucode-tool/iucode-tool/wikis/home"
license=('GPL')
makedepends=()
source=("https://gitlab.com/iucode-tool/releases/raw/master/${pkgname}_${pkgver}.tar.xz"
    "https://gitlab.com/iucode-tool/releases/raw/master/${pkgname}_${pkgver}.tar.xz.asc")
noextract=()
sha256sums=('610ae7695f74b0dbe2dba20435321534f267596827fec6d823999b14b46f7934'
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
