# Maintainer: taotieren <admin@taotieren.com>

pkgname=xrock
pkgver=1.1.1
pkgrel=1
epoch=
pkgdesc="The low level tools for rockchip SOC with maskrom and loader mode support."
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/xboot/xrock"
license=('MIT')
groups=()
depends=(
    'glibc'
    'libusb')
makedepends=("gcc")
checkdepends=()
optdepends=()
provides=()
conflicts=(xrock)
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('993137e4130954bc4d3a8630c30b39f7f93b30ffc22cdd9e375ff89db23a1b69')
#validpgpkeys=()

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    install -Dm0755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/99-xrock.rules" "${pkgdir}/etc/udev/rules.d/99-xrock.rules"
    install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
