# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Light2Yellow <alexvilchansky@yahoo.com>
# Contributor: yaroslav <proninyaroslav@mail.ru>
# Contributor: V0K3 <v0k3@inventati.org>

pkgname=sasm
pkgver=3.9.0
pkgrel=1
pkgdesc="Simple crossplatform IDE for NASM, MASM, GAS, FASM assembly languages"
arch=('i686' 'x86_64')
url="http://dman95.github.io/SASM/english.html"
license=('GPL3')
depends=('qt5-base' 'nasm' 'gdb')
depends_i686=('gcc')
depends_x86_64=('gcc-multilib')
conflicts=('fasm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Dman95/SASM/archive/v${pkgver}.tar.gz")
sha256sums=('1a50bb1fd52a7f0e791bb15e659c7267b20246aad71b16420c22c5616c316602')

build() {
    cd "${srcdir}/SASM-${pkgver}"
    qmake PREFIX="/usr"
    make
}

package() {
    cd "${srcdir}/SASM-${pkgver}"
    make INSTALL_ROOT="${pkgdir}" install
}
