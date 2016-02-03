# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: V0K3 <v0k3@inventati.org>

pkgname=sasm
pkgver=3.3.0
pkgrel=1
pkgdesc="Simple crossplatform IDE for NASM, MASM, GAS, FASM assembly languages"
arch=('i686' 'x86_64')
url="http://dman95.github.io/SASM/english.html"
license=('GPL3')
depends=('qt4>=4.8' 'nasm' 'gdb' 'gcc')
depends_x86_64+=('gcc-multilib')

source=("https://github.com/Dman95/SASM/archive/v${pkgver}.tar.gz")
sha256sums=('ae873eacfc4f74195fa7eb6ff3972aa4b14fca1de7c1dd5de11f7c8e7f9aacfb')

build() {
cd "${srcdir}/SASM-${pkgver}"
qmake PREFIX="${pkgdir}/usr"
make
}

package() {
cd "${srcdir}/SASM-${pkgver}"
make install
}
