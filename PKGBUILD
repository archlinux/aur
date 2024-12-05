# Maintainer: taotieren <admin@taotieren.com>

pkgname=xrock
pkgver=1.1.2
pkgrel=4
epoch=
pkgdesc="The low level tools for rockchip SOC with maskrom and loader mode support."
arch=($CARCH)
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
sha256sums=('ac276eac24fdb77021f777b800ec96875f86d82715e291363d451f7146a2aff0')
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
