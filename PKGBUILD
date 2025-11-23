# Maintainer: Sohrab Behdani <behdanisohrab@riseup.net>
pkgname=arad-fonts
pkgver=2.0.1
pkgrel=1
pkgdesc="Arad - A multilingual, open-source font with 8 weights and 4 dot styles, supporting Farsi, Arabic, Kurdish, Turkish, Urdu, and Mazerouni languages"
arch=('any')
url="https://github.com/MohamadDarvishi/Arad"
license=('OFL')
source=("https://github.com/MohamadDarvishi/Arad/releases/download/${pkgver}/Arad-${pkgver}.zip")
sha256sums=('ec4dbc9774ea96ed84adde6ef114e98bb38f74af15e3a4bdb84dc90fb6dee659')

package() {
    install -dm755 "${pkgdir}/usr/share/fonts/TTF"

    bsdtar -xvf "${srcdir}/Arad-${pkgver}.zip" \
        -C "${pkgdir}/usr/share/fonts/TTF" \
        --strip-components=3 \
        "Arad-2.0.0-Package/main/static-ttf"

    find "${pkgdir}/usr/share/fonts/TTF" -type f -exec chmod 644 {} \;
}
