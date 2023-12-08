# Maintainer: taotieren <admin@taotieren.com>

pkgname=xrock
pkgver=1.0.4
pkgrel=3
epoch=
pkgdesc="The low level tools for rockchip SOC with maskrom and loader mode support."
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/xboot/xrock"
license=('MIT')
groups=()
depends=('libusb')
makedepends=("gcc")
checkdepends=()
optdepends=()
provides=()
conflicts=(xrock-git)
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('3878af78d81afc64d58f7975dd77047e83fa9872a815d9359ad2b748418d0cdc')
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
