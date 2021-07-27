# Maintainer: taotieren <admin@taotieren.com>

pkgname=freedom-devicetree-tools
pkgver=20.08.00.00
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
sha256sums=('4a28d6d1f530f1ef913fac8f6ce55d7661799cefebe871db842799f2be216db4')
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
