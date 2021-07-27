# Maintainer: taotieren <admin@taotieren.com>

pkgname=freedom-devicetree-tools
pkgver=20.05.RC.01
pkgrel=1
epoch=
pkgdesc="This project contains a handful of tools that are designed to aid embedded software developers to generate statically parameterized designs from Freedom platform device trees."
arch=('any')
url="https://github.com/sifive/freedom-devicetree-tools"
license=('Apache' 'MIT')
groups=()
depends=('gcc')
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
source=("${pkgname}-${pkgver}.tar.gz::https://download.fastgit.org/sifive/freedom-devicetree-tools/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('e15328769925baa8fe8ffbacee83485100521e2fbd0eb861808c77ffac839044')
#validpgpkeys=()

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
#     install -Dm0755 "${srcdir}/${pkgname}-${pkgver}/generate_openocdcfg.py" "${pkgdir}/usr/bin/${pkgname}"
    make DESTDIR=${pkgdir} install
}
