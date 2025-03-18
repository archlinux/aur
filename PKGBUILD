# Maintainer: taotieren <admin@taotieren.com>

pkgname=qbootctl
pkgver=0.2.1
pkgrel=1
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
sha256sums=('8039519c6fdc9d8409c06b512507377b79a2127ab67c8d0cc650abf4c4ef16fb')
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
