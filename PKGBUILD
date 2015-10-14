# Maintainer: skydrome <skydrome@i2pmail.org>
# Contributor: skydrome <skydrome@i2pmail.org>

pkgname=blackmarket
pkgver=0.4
pkgrel=1
pkgdesc="items search tool for Path of Exile"
url="http://thirdy.github.io/blackmarket"
license=('GPL2')
arch=('any')
depends=('java-runtime>=8' 'java-openjfx')
PKGEXT='.pkg.tar'

source=("https://github.com/thirdy/${pkgname}/releases/download/v${pkgver}/${pkgname}.zip"
        "icon-48x48.png"
        "blackmarket.sh")

sha256sums=('314752b37296f475dffee6c753c24586aac7fffd7dddf61f0cd82d468164e4ac'
            'ca332b1084f0d4cdd35ecb91e3cfec4f3b04bb997ceb746743644d6493ada4f8'
            '561b088644527640a135c927f444bdec5284025c213707db7021803156597c76')

package() {
    cd "$srcdir/$pkgname"
    install -Dm644 "${pkgname}-v${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm755 ../blackmarket.sh "${pkgdir}/usr/bin/blackmarket"
    install -Dm644 ../icon-48x48.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/blackmarket.png"
}
