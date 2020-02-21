# Maintainer: Mathias Walters <waltersm@protonmail.com>

pkgname=maptool-jar
_pkgname=MapTool
pkgver=1.5.13
pkgrel=1
pkgdesc="An open source virtual tabletop program"
arch=('x86_64')
url="https://rptools.net/tools/maptool"
license=('AGPL3')
depends=('java-runtime-jre=10')
optdepends=('gvfs: access virtual filesystem')
provides=('maptool')
conflicts=('maptool')
source=(
    "https://github.com/RPTools/maptool/releases/download/$pkgver/$_pkgname-$pkgver.jar"
    "$_pkgname"
    "$_pkgname.desktop"
)
sha256sums=(
    '71a859dc00ef1c53b18d563271a1de48bf55a662ca687cd4368d3a82bd8a6735'
    '4ee0df3f5826df5c1062deffef7b845184eaa7729253bde97bdcbc2287e62cfb'
    '4db045122b4dbb7ca04db3359faa6a991e7c5b7e222ff8ddacd1cbc4012fec3b'
)

package() {
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}.jar" -t "${pkgdir}/usr/share/java/${_pkgname}/"
    install -Dm755 "${srcdir}/${_pkgname}" -t "${pkgdir}/usr/bin/"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
}
