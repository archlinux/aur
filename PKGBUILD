# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: V0K3 <v0k3@inventati.org>

pkgname=sasm
pkgver=3.5.0
pkgrel=1
pkgdesc="Simple crossplatform IDE for NASM, MASM, GAS, FASM assembly languages"
arch=('i686' 'x86_64')
url="http://dman95.github.io/SASM/english.html"
license=('GPL3')
depends=('qt4>=4.8' 'nasm' 'gdb' 'gcc')
depends_x86_64+=('gcc-multilib')
source=("https://github.com/Dman95/SASM/archive/v${pkgver}.tar.gz")
sha256sums=('44b84460a44bdf63c5070cf7b622b9ffb106289f6025730d5e81f39998acd8ca')

build() {
    cd "${srcdir}/SASM-${pkgver}"
    qmake PREFIX="${pkgdir}/usr"
    make
}

package() {
    cd "${srcdir}/SASM-${pkgver}"
    make install
}
