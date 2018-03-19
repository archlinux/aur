# Maintainer: Andreas Bosch <admin@progandy.de>
pkgname=iucode-tool
pkgver=2.3.1
pkgrel=1
pkgdesc="Tool to manipulate Intel® IA-32/X86-64 microcode bundles"
arch=(x86_64 i686)
url="https://gitlab.com/iucode-tool/iucode-tool/wikis/home"
license=('GPL')
depends=(glibc)
source=("https://gitlab.com/iucode-tool/releases/raw/master/${pkgname}_${pkgver}.tar.xz"
    "https://gitlab.com/iucode-tool/releases/raw/master/${pkgname}_${pkgver}.tar.xz.asc")
noextract=()
sha256sums=('12b88efa4d0d95af08db05a50b3dcb217c0eb2bfc67b483779e33d498ddb2f95'
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
