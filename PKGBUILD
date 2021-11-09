# Maintainer: taotieren <admin@taotieren.com>

pkgname=xrock
pkgver=1.0.2
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
conflicts=(xrock-git)
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://ghproxy.com/${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('25f19a4842ed0a2e0f736905f4c21791c86655399f472724df53de5b4d5095a0')
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
