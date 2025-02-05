# Maintainer: taotieren <admin@taotieren.com>

pkgname=qbootctl
pkgver=0.2.0
pkgrel=0
epoch=
pkgdesc="Qualcomm bootctl HAL for Linux."
arch=($CARCH)
url="https://github.com/linux-msm/qbootctl"
license=('GPL-3.0-or-later')
groups=()
depends=(glibc)
makedepends=(
    meson
    ninja)
checkdepends=()
optdepends=()
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
noextract=()
sha256sums=('08028c28ad157155c0ce6baab780908c4e460503e83d22ce1f4b0932a66fdd3f')
#validpgpkeys=()

build() {
    arch-meson ${pkgname}-${pkgver} build
    ninja -C build
}

# check() {
#     meson test -C ${srcdir}/build
# }

package() {
    DESTDIR="${pkgdir}" ninja -C ${srcdir}/build install
}
