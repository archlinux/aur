# Maintainer: taotieren <admin@taotieren.com>

pkgname=elf2hex
pkgver=20.05.RC.04
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
sha256sums=('9a0ba603106144995bda590f8f482be9f7bd5b0713ff7bd6323e201a0eb25a1b')
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
