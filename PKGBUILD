# Maintainer: taotieren <admin@taotieren.com>

pkgname=xfel
pkgver=1.3.3
pkgrel=1
epoch=
pkgdesc="Tiny FEL tools for allwinner SOC, support RISC-V D1 chip."
arch=($CARCH)
url="https://github.com/xboot/xfel"
license=('MIT')
groups=()
depends=('libusb'
    'glibc')
makedepends=("gcc")
checkdepends=()
optdepends=()
provides=()
conflicts=(xfel-git)
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('f4af683caed394ed8a2c4b384a470275cc9c09282800f540de1cf20e7161827d')
#validpgpkeys=()

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    install -Dm0755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/99-xfel.rules" "${pkgdir}/etc/udev/rules.d/99-xfel.rules"
    install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
