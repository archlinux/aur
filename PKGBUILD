# Maintainer: taotieren <admin@taotieren.com>

pkgname=elf2hex
pkgver=20.05.01.00
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
sha256sums=('ad1b12273b3a195fa9b5e7ba246f755bbdec1767f9c37141acfbe9dd1bda1abd')
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
