# Maintainer: skydrome <skydrome@i2pmail.org>
# Contributor: skydrome <skydrome@i2pmail.org>

pkgname=blackmarket
pkgver=0.6
pkgrel=1
pkgdesc="items search tool for Path of Exile"
url="http://thirdy.github.io/blackmarket"
license=('GPL2')
arch=('any')
depends=('java-runtime>=8' 'java-openjfx')
PKGEXT='.pkg.tar'

source=("https://github.com/thirdy/${pkgname}/releases/download/v${pkgver}/${pkgname}-without-jre.zip"
        "icon-48x48.png"
        "blackmarket.sh")

sha256sums=('a009d3a6fa4f5b11fe5bbed81601d5cfc97387af0ea0c703f4faed5f079f59f4'
            'ca332b1084f0d4cdd35ecb91e3cfec4f3b04bb997ceb746743644d6493ada4f8'
            '947d28a04c465c98693e6194fcfd1f1355cc2cac2445e5224b75004bc7e4ed67')

package() {
    cd "$srcdir/blackmarket"
    install -dm755 "${pkgdir}/usr/share/java/${pkgname}"

    install -Dm644 lib/jars/*        "${pkgdir}/usr/share/java/${pkgname}/"
    install -Dm755 ../${pkgname}.sh  "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 ../icon-48x48.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
}
