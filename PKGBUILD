# Maintainer: Sohrab Behdani <behdanisohrab@riseup.net>
pkgname=arad-fonts
pkgver=2.2.0
pkgrel=1
pkgdesc="Arad - A multilingual, open-source font with 8 weights and 4 dot styles, supporting Farsi, Arabic, Kurdish, Turkish, Urdu, and Mazerouni languages"
arch=('any')
url="https://github.com/MohamadDarvishi/Arad"
license=('OFL')
source=("https://github.com/MohamadDarvishi/Arad/releases/download/${pkgver}/arad-${pkgver}.for-terminal.zip")
sha256sums=('95c1d43918db7ac5d119d8892fea6f9b7c611fb49c53b180c143ed83e2b437db')

package() {
    install -dm755 "${pkgdir}/usr/share/fonts/TTF"

    bsdtar -xf "${srcdir}/arad-${pkgver}.for-terminal.zip" -C "${srcdir}"

    find "${srcdir}" -type f -name "*.ttf" \
        -exec install -m644 {} "${pkgdir}/usr/share/fonts/TTF/" \;

    find "${pkgdir}/usr/share/fonts/TTF" -type f -exec chmod 644 {} \;
}

