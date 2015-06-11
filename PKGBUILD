# Maintainer: Andreas Bosch <admin@progandy.de>
pkgname=iucode-tool
pkgver=1.2.1
pkgrel=1
pkgdesc="Tool to manipulate Intel® IA-32/X86-64 microcode bundles"
arch=(x86_64 i686)
url="https://gitorious.org/iucode-tool"
license=('GPL')
makedepends=()
source=("https://gitorious.org/iucode-tool/releases/raw/master:${pkgname}_${pkgver}.tar.xz"
    "https://gitorious.org/iucode-tool/releases/raw/master:${pkgname}_${pkgver}.tar.xz.asc")
noextract=()
md5sums=('0d1a56323299b3b5c1a50bf3c73cd29d'
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
