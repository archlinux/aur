# Maintainer: Infernio <infernio at icloud dot com>
pkgname=air-for-steam
pkgver=2018_0805
pkgrel=5
pkgdesc="An elegant and customizable skin for Steam"
arch=('any')
url="https://github.com/airforsteam/Air-for-Steam"
license=('custom:cc-by-nc-4.0')
depends=('steam' 'sssm>=1.2.0')
install=air-for-steam.install
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/airforsteam/Air-for-Steam/archive/${pkgver//_/-}.tar.gz")
sha256sums=('838df672cdc28ba8491a7bea033807384bf360f8f3873db383a3c1c12b82e3ab')

package() {
    cd "${srcdir}"
    DESTDIR="${pkgdir}/usr/share/steam/skins/${pkgname}"
    LCNSDIR="${pkgdir}/usr/share/licenses/${pkgname}"
    FONTDIR="${pkgdir}/usr/share/fonts/${pkgname}"

    mkdir -p "${DESTDIR}"
    mkdir -p "${LCNSDIR}"
    mkdir -p "${FONTDIR}"
    cp -r "Air-for-Steam-${pkgver//_/-}/." "${DESTDIR}"
    cp "${DESTDIR}/LICENSE.txt" "${LCNSDIR}"
    cp "${DESTDIR}/+Extras/Fonts"/* "${FONTDIR}"
}
