# Maintainer: taotieren <admin@taotieren.com>

pkgname=xfel
pkgver=1.1.0
pkgrel=1
pkgdesc="Tiny FEL tools for allwinner SOC, support RISC-V D1 chip."
arch=('any')
url="https://github.com/xboot/xfel"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname}-git)
#replaces=(${pkgname})
depends=('libusb')
makedepends=()
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f22160440a79172f48b500487b713c5359a1b80f7b06683bbac834928ba37620')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
