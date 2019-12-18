# Maintainer: Mathias Walters <waltersm@protonmail.com>

pkgname=maptool-jar
_pkgname=MapTool
pkgver=1.5.8
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
    '3130587ee213a6e781e9fb97cfd5417f7fddbaaf9a760b2fd73c3ed0e5b6d96c'
    '237a14cea4597599d67684299e31837d9a2d45a7b3e7dbf961f2d9049daf1a54'
    '4db045122b4dbb7ca04db3359faa6a991e7c5b7e222ff8ddacd1cbc4012fec3b'
)

package() {
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}.jar" -t "${pkgdir}/usr/share/java/${_pkgname}/"
    install -Dm755 "${srcdir}/${_pkgname}" -t "${pkgdir}/usr/bin/"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
}
