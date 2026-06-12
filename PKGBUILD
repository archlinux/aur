# Maintainer: FT <worldoptimizer@gmail.com>

pkgname=hp-omen-gaming-wmi-dkms
_pkgname=hp-wmi
pkgver=1.0.10
pkgrel=1
pkgdesc="HP WMI driver for OMEN Gaming laptops (unlocked TGP and board 8E35 support)"
url="https://github.com/nevetscar/hp-omen-gaming-wmi-dkms"
arch=('any')
license=('GPL2')
depends=('dkms')
makedepends=('git')
source=("git+https://github.com/nevetscar/${pkgname}.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}"
    install -d "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    cp -r . "${pkgdir}/usr/src/${_pkgname}-${pkgver}/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -rf "${pkgdir}/usr/src/${_pkgname}-${pkgver}/.git"
}