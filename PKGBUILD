# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: V0K3 <v0k3@inventati.org>

pkgname=sasm
pkgver=3.2.0
pkgrel=1
pkgdesc="Simple crossplatform IDE for NASM, MASM, GAS, FASM assembly languages"
arch=('i686' 'x86_64')
url="http://dman95.github.io/SASM/english.html"
license=('GPL3')
depends=('qt4>=4.8' 'nasm' 'gdb' 'gcc')
depends_x86_64+=('gcc-multilib')
optdepends=(
	'nasmx: a collection of macros, include files and examples for linux, x11, gtk, opengl'
)
source=("https://github.com/Dman95/SASM/archive/v${pkgver}.tar.gz")
md5sums=("c7cc0e7b834a8be13286ad48aefbd1a0")

build() {
	cd "${srcdir}/SASM-${pkgver}"
	qmake PREFIX="${pkgdir}/usr"
	make
}

package() {
	cd "${srcdir}/SASM-${pkgver}"
	make install
}
