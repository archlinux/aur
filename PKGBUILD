# Maintainer: Sohrab Behdani <behdanisohrab@riseup.net>
pkgname=arad-fonts
pkgver=2.1.0
pkgrel=1
pkgdesc="Arad - A multilingual, open-source font with 8 weights and 4 dot styles, supporting Farsi, Arabic, Kurdish, Turkish, Urdu, and Mazerouni languages"
arch=('any')
url="https://github.com/MohamadDarvishi/Arad"
license=('OFL')
source=("https://github.com/MohamadDarvishi/Arad/releases/download/${pkgver}/arad-${pkgver}.for-unnormal-installing.zip")
sha256sums=('dc1c11ab4e0f67ffe1252b46f112366bef9d9669f889462b8dc7e07bff2e57dd')

package() {
    install -dm755 "${pkgdir}/usr/share/fonts/TTF"

    bsdtar -xf "${srcdir}/arad-${pkgver}.for-unnormal-installing.zip" -C "${srcdir}"

    find "${srcdir}" -type f -name "*.ttf" \
        -exec install -m644 {} "${pkgdir}/usr/share/fonts/TTF/" \;

    find "${pkgdir}/usr/share/fonts/TTF" -type f -exec chmod 644 {} \;
}

