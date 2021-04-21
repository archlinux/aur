# Maintainer: Fabian Köhler <fabian.koehler@protonmail.ch>
# Contributor: Fabian Köhler <fabian.koehler@protonmail.ch>

pkgname=xp-pen
_pkgname=${pkgname}
pkgver=3.1.0.210331
pkgrel=1
pkgdesc="Software for XP-PEN graphics tablets"
arch=(x86_64)
url="https://www.xp-pen.com/download/index.html"
license=("unknown")
depdends=("libxtst")
provides=(${_pkgname})
conflicts=(${_pkgname} xp-pen-tablet)
source=("${pkgname}-${pkgver}.tar.gz::https://download01.xp-pen.com/file/2021/04/xp-pen-pentablet_${pkgver}-1.${CARCH}.tar.gz")
sha256sums=('9e50510d0f6afaad349e6182d6a275ad1527cc02ed90251620c38a37b0486d12')

package() {
    cd "${srcdir}/${pkgname}-pentablet_${pkgver}.${CARCH}/App"

    install -Dm 755 lib/udev/rules.d/10-xp-pen.rules ${pkgdir}/usr/lib/udev/rules.d/10-xp-pen.rules
    find usr -type f -exec install -Dm 755 "{}" "${pkgdir}/{}" \;
}
