# Maintainer: skydrome <skydrome@i2pmail.org>
# Contributor: skydrome <skydrome@i2pmail.org>

pkgname=blackmarket
pkgver=0.5.1
pkgrel=1
pkgdesc="items search tool for Path of Exile"
url="http://thirdy.github.io/blackmarket"
license=('GPL2')
arch=('any')
depends=('java-runtime>=8' 'java-openjfx')
PKGEXT='.pkg.tar'
noextract=("${pkgname}-${pkgver}.jar")

source=("https://github.com/thirdy/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.jar"
        "icon-48x48.png"
        "blackmarket.sh")

sha256sums=('1bda25862aaaa58fcb20523e2f597067d52da30708f0702319700d5324f7a163'
            'ca332b1084f0d4cdd35ecb91e3cfec4f3b04bb997ceb746743644d6493ada4f8'
            '561b088644527640a135c927f444bdec5284025c213707db7021803156597c76')

package() {
    cd "$srcdir"
    install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm755 blackmarket.sh "${pkgdir}/usr/bin/blackmarket"
    install -Dm644 icon-48x48.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/blackmarket.png"
}
