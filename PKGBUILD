# Maintainer: taotieren <admin@taotieren.com>

pkgname=xrock
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="The low level tools for rockchip SOC with maskrom and loader mode support."
arch=('any')
url="https://github.com/xboot/xrock"
license=('MIT')
groups=()
depends=('libusb')
makedepends=("gcc")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://download.fastgit.org/xboot/xrock/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('7f7d1c93896f0288e67e82dcdedfcd209a6676a7e5340c08a3b769cf44b9aa19')
#validpgpkeys=()

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm0755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/99-xrock.rules" "${pkgdir}/etc/udev/rules.d/99-xrock.rules"
    install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
