# Maintainer: Fabian Köhler <fabian.koehler@protonmail.ch>
# Contributor: Fabian Köhler <fabian.koehler@protonmail.ch>

pkgname=xp-pen
_pkgname=${pkgname}
pkgver=3.1.4.210605
pkgrel=1
pkgdesc="Software for XP-PEN graphics tablets"
arch=(x86_64)
url="https://www.xp-pen.com/download/index.html"
license=("unknown")
depdends=("libxtst")
provides=(${_pkgname})
conflicts=(${_pkgname} xp-pen-tablet)
source=("${pkgname}-${pkgver}.tar.gz::https://download01.xp-pen.com/file/2021/06/XP-PEN-pentablet-${pkgver}-1.${CARCH}.tar.gz")
sha256sums=('ed37236f6a0e51cae3f893e6318231afed71ec487b046cbcdfad72598d12777c')

package() {
    cd "${srcdir}/${pkgname}-pentablet-${pkgver}-1.${CARCH}/App"
    install -Dm 755 lib/udev/rules.d/10-xp-pen.rules ${pkgdir}/usr/lib/udev/rules.d/10-xp-pen.rules
    find usr -type f -exec install -Dm 755 "{}" "${pkgdir}/{}" \;
}
