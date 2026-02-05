pkgname=arad-fonts
pkgver=2.3.0
pkgrel=1
pkgdesc="Arad - A multilingual, open-source font with 8 weights and 4 dot styles, supporting Farsi, Arabic, Kurdish, Turkish, Urdu, and Mazerouni languages"
arch=('any')
url="https://github.com/MohamadDarvishi/Arad"
license=('OFL')
source=("https://github.com/MohamadDarvishi/Arad/releases/download/${pkgver}/arad_${pkgver}.for-terminal.zip")
sha256sums=('15c8daa08c8f312429d50d8f13821880f667ea54e43d66f1cc2d8159cca3b402')
package() {
    install -dm755 "${pkgdir}/usr/share/fonts/TTF"
    bsdtar -xf "${srcdir}/arad_${pkgver}.for-terminal.zip" -C "${srcdir}"
    find "${srcdir}" -type f -name "*.ttf" \
        -exec install -m644 {} "${pkgdir}/usr/share/fonts/TTF/" \;
    find "${pkgdir}/usr/share/fonts/TTF" -type f -exec chmod 644 {} \;
}
