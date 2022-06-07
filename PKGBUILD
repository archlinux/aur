# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=treemap
pkgver=3b1243
pkgrel=3
pkgdesc="a tool for analysing relationships between evolutionary histories of ecologically linked species"
arch=('x86_64')
url="https://sites.google.com/site/cophylogeny/treemap/"
license=('custom')
makedepends=('wget')
source=("treemap.desktop" "treemap.png")
sha256sums=('dd308f7e4596edef57be9bbbfc7a7088a27f75763feae02e446c9d16518940e5'
            '514cbfcb94803808141cc6fae9b58eabfe58ba7a55d5d5f3f1061cd7a154b28e')
depends=(
    'java-runtime'
)
package() {
    wget "https://sites.google.com/site/cophylogeny/software/TreeMap${pkgver}.jar"
    install -dm755 "$pkgdir"/usr/share/{treemap,icons,applications}
    install -Dm644 ${srcdir}/TreeMap${pkgver}.jar ${pkgdir}/usr/share/treemap/TreeMap.jar
    install -Dm 755 ${srcdir}/*.desktop ${pkgdir}/usr/share/applications
    install -Dm 755 ${srcdir}/*.png ${pkgdir}/usr/share/icons
}
