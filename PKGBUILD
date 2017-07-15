# Contributor: Tilman Blumenbach <tilman [AT] ax86 [DOT] net>

pkgname='terminus-font-ttf'
pkgver=4.46.0
pkgrel=1
pkgdesc="Monospaced bitmap font designed for long work with computers (TTF version, mainly for Java applications)"
arch=('any')
url="http://files.ax86.net/terminus-ttf"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
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

sha384sums=('c134df563057c9c41499830ab2e000fbb34e69f2df72a3dfa79eec250e6392141176a81ca411e53034f7e7e2ec245844')
