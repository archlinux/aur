# Maintainer: taotieren <admin@taotieren.com>

pkgname=elf2hex
pkgver=20.05.00.03
pkgrel=1
epoch=
pkgdesc="SiFive's Verilog test harnesses can't directly read ELF binaries but are instead required to be provided with a hexidecimal dump of a particular width and depth. This project allows users to easily create these files."
arch=('any')
url="https://github.com/sifive/elf2hex"
license=('Apache' 'MIT')
groups=()
depends=('bash')
makedepends=('autoconf' 'automake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://download.fastgit.org/sifive/elf2hex/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('8020941a90eaf274637f21a5f1356f743120c377c28e0df151c8f174c6bdf236')
#validpgpkeys=()

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --target=riscv64-unknown-elf --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR=${pkgdir} install
}
