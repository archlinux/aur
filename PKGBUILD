# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Light2Yellow <alexvilchansky@yahoo.com>
# Contributor: yaroslav <proninyaroslav@mail.ru>
# Contributor: V0K3 <v0k3@inventati.org>

pkgname=sasm
pkgver=3.8.0
pkgrel=2
pkgdesc="Simple crossplatform IDE for NASM, MASM, GAS, FASM assembly languages"
arch=('i686' 'x86_64')
url="http://dman95.github.io/SASM/english.html"
license=('GPL3')
depends=('qt5-base' 'nasm' 'gdb')
depends_i686=('gcc')
depends_x86_64=('gcc-multilib')
conflicts=('fasm')
source=("https://github.com/Dman95/SASM/archive/v${pkgver}.tar.gz")
sha256sums=('c61ac0de8959e2d5e2d6fa20718f97bfbc0ed79c0c7d80f14b4dedcab93dd0d7')

build() {
    cd "${srcdir}/SASM-${pkgver}"
    qmake PREFIX="/usr"
    make
}

package() {
    cd "${srcdir}/SASM-${pkgver}"
    make INSTALL_ROOT="${pkgdir}" install
}
