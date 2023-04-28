# Maintainer: Tilman Blumenbach <tilman [AT] ax86 [DOT] net>

pkgname='terminus-font-ttf'
pkgver=4.49.3
pkgrel=1
pkgdesc="Monospaced bitmap font designed for long work with computers (TTF version, mainly for Java applications)"
arch=('any')
url="https://files.ax86.net/terminus-ttf"
license=('custom:OFL')
depends=('fontconfig' 'xorg-mkfontdir')
install='terminus-font-ttf.install'
source=("https://files.ax86.net/terminus-ttf/files/${pkgver}/terminus-ttf-${pkgver}.zip")

package()
{
    cd "${srcdir}/terminus-ttf-${pkgver}"

    for i in *.ttf; do
        local destname="$(echo "$i" | sed -E 's|-[[:digit:].]+\.ttf$|.ttf|')"
        install -Dm 644 "$i" "${pkgdir}/usr/share/fonts/TTF/${destname}"
    done

    install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

sha256sums=('0ead921d98d99a4590ffe6cd66dc037fc0a2ceea1c735d866ba73fe058257577')
