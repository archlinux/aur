# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgbase=fantasque-sans-mono
pkgname=('otf-fantasque-sans-mono' 'ttf-fantasque-sans-mono')
pkgver=1.7.2
pkgrel=1
arch=('any')
url="https://github.com/belluzj/fantasque-sans"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/belluzj/fantasque-sans/releases/download/v${pkgver}/FantasqueSansMono-Normal.tar.gz")
sha512sums=('f854de5a5e0464d7f69b484c4ae0f59cfdcaa65d357b9935eda1df8cb90781f78c6b6ab0a96ac5099a6464a52de14cf26630d3db5dad8228e86e44033b32c228')

package_otf-fantasque-sans-mono() {
    pkgdesc="An OTF font family with a great monospaced variant for programmers."
    install -dm755 "${pkgdir}/usr/share/fonts/OTF"
    install -m644 "${srcdir}/OTF/"*.otf "${pkgdir}/usr/share/fonts/OTF"
    install -D -m644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname[0]}/LICENSE"
}

package_ttf-fantasque-sans-mono() {
    pkgdesc="A TTF font family with a great monospaced variant for programmers."
    conflicts=('ttf-fantasque-sans-git')
    replaces=('ttf-fantasque-sans')
    install -dm755 "${pkgdir}/usr/share/fonts/TTF"
    install -m644 "${srcdir}/TTF/"*.ttf "${pkgdir}/usr/share/fonts/TTF"
    install -D -m644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname[1]}/LICENSE"
}
