# Maintainer: Infernio <infernio at icloud dot com>
pkgname=air-for-steam
pkgver=2018_0805
pkgrel=1
pkgdesc="An elegant and customizable skin for Steam"
arch=('any')
url="https://github.com/Outsetini/Air-for-Steam"
license=('custom:cc-by-nc-4.0')
depends=('steam' 'sssm')
install=air-for-steam.install
source=("https://github.com/Outsetini/Air-for-Steam/archive/${pkgver//_/-}.tar.gz")
sha256sums=('838df672cdc28ba8491a7bea033807384bf360f8f3873db383a3c1c12b82e3ab')

package() {
    cd "${srcdir}"
    DESTDIR="${pkgdir}/usr/lib/steam/skins/${pkgname}"
    LIBDIR="${pkgdir}/usr/share/licenses/${pkgname}"

    mkdir -p "${DESTDIR}"
    mkdir -p "${LIBDIR}"
    cp -r "Air-for-Steam-${pkgver//_/-}/." "${DESTDIR}"
    cp "${DESTDIR}/LICENSE.txt" "${LIBDIR}"
}
