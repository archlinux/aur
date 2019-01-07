# Maintainer: Infernio <infernio at icloud dot com>
pkgname=air-for-steam
pkgver=2018_1114
pkgrel=1
pkgdesc="An elegant and customizable skin for Steam"
arch=('any')
url="https://github.com/airforsteam/Air-for-Steam"
license=('custom:cc-by-nc-4.0')
depends=('steam' 'sssm>=1.2.0')
install=air-for-steam.install
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/airforsteam/Air-for-Steam/archive/${pkgver//_/-}.tar.gz")
sha256sums=('82ae3b630ff0dc8357b9bf61f57081c039a4e3c1deda1548c788ead2365101a9')

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
