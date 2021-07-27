# Maintainer: taotieren <admin@taotieren.com>

pkgname=freedom-devicetree-tools
pkgver=20.05.00.02
pkgrel=1
epoch=
pkgdesc="This project contains a handful of tools that are designed to aid embedded software developers to generate statically parameterized designs from Freedom platform device trees."
arch=('any')
url="https://github.com/sifive/freedom-devicetree-tools"
license=('Apache' 'MIT')
groups=()
depends=('dtc')
makedepends=('autoconf' 'automake' 'gcc-libs')
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
sha256sums=('668f9f0a9fcfd6fd5f1de6f833d6b0cf6dc58a7763045825efcc7f88dba15f12')
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
