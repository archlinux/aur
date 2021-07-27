# Maintainer: taotieren <admin@taotieren.com>

pkgname=freedom-devicetree-tools
pkgver=20.05.RC.03
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
sha256sums=('0df31ec8a2f4c309f7f4d558705ebc4a597eceab368378f8b2c587caf02c88ad')
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
