# Maintainer: taotieren <admin@taotieren.com>

pkgname=elf2hex
pkgver=20.08.00.00
pkgrel=13
epoch=
pkgdesc="SiFive's Verilog test harnesses can't directly read ELF binaries but are instead required to be provided with a hexidecimal dump of a particular width and depth. This project allows users to easily create these files."
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/sifive/elf2hex"
license=('Apache-2.0' 'MIT')
groups=()
depends=('bash')
makedepends=('autoconf' 'automake' 'python')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('16d3f51b5f4718a1074bb985543b54e7a2e615d0a501e761d68c79bfbae6185b')
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
