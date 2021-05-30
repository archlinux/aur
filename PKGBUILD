# Maintainer: taotieren <admin@taotieren.com>

pkgname=xfel
pkgver=1.0.1
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
sha256sums=('85b8f1fe6a58149c9eb5c270e279f0dbedb882a349799a70105e4e415182aa9a')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
