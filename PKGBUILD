# Maintainer: taotieren <admin@taotieren.com>

pkgname=xrock
pkgver=1.0.9
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
sha256sums=('e0085220c2462fd2e26f28c5b3bb71230e68ab899fbad640a4d7b79206743f4d')
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
