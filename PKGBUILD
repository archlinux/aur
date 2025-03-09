# Maintainer: taotieren <admin@taotieren.com>

pkgname=freedom-devicetree-tools
pkgver=201908
pkgrel=2
epoch=
pkgdesc="This project contains a handful of tools that are designed to aid embedded software developers to generate statically parameterized designs from Freedom platform device trees."
arch=($CARCH)
url="https://github.com/sifive/freedom-devicetree-tools"
license=('Apache-2.0 AND MIT')
groups=()
depends=(
    gcc-libs
    glibc
    dtc
)
makedepends=(
    autoconf
    automake
)
checkdepends=()
optdepends=(
    'nuclei-openocd: nuclei-openocd 是 Nuclei Studio IDE 的调试工具。'
    'nuclei-gcc: nuclei-gcc 是 Nuclei Studio IDE 的编译工具。'
    'nucleistudioide: Nuclei Studio IDE 是基于 MCU Eclipse IDE 开发的一款针对芯来公司处理器核产品的集成开发环境工具，用于 RISC-V 开发继承了 Eclipse IDE 平台的各种优势。'
)
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('f4810b2cbbcec35c9a846f370cfe014098523ad1975582e6daa8955320495773')
#validpgpkeys=()

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR=${pkgdir} install
}
