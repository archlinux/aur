# Maintainer: Infernio <infernio at icloud dot com>
pkgname=air-for-steam
pkgver=2019_0917
pkgrel=1
pkgdesc="An elegant and customizable skin for Steam"
arch=('any')
url="https://github.com/airforsteam/Air-for-Steam"
license=('custom:cc-by-nc-4.0')
depends=('steam' 'sssm>=1.2.0')
install=air-for-steam.install
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/airforsteam/Air-for-Steam/archive/${pkgver//_/-}.tar.gz")
sha256sums=('9c24d352a0ee08cad7a566f2bcaacd03d94ca405596a1ce5d3128dbb04e3963a')

package() {
    cd "${srcdir}"
    DESTDIR="${pkgdir}/usr/share/steam/skins/air-for-steam"
    LCNSDIR="${pkgdir}/usr/share/licenses/air-for-steam"
    FONTDIR="${pkgdir}/usr/share/fonts/air-for-steam"

    mkdir -p "${DESTDIR}"
    mkdir -p "${LCNSDIR}"
    mkdir -p "${FONTDIR}"
    cp -r "Air-for-Steam-${pkgver//_/-}/." "${DESTDIR}"
    cp "${DESTDIR}/LICENSE.txt" "${LCNSDIR}"
    cp "${DESTDIR}/+Extras/Fonts"/* "${FONTDIR}"
}
