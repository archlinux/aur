# Maintainer: Michael Schoenwaelder <m.schoenwaelder@posteo.de>

pkgname=zettelkasten
_pkgname=Zettelkasten
pkgver=3.3.1
pkgrel=1
pkgdesc="A Zettelkasten software based on the working principle of Niklas Luhmann"
arch=('x86_64')
url="http://zettelkasten.danielluedecke.de/"
license=('GPL3')
depends=('java-runtime')
provides=('zettelkasten')
conflicts=('zettelkasten')
source=(
    "https://github.com/Zettelkasten-Team/Zettelkasten/releases/download/v$pkgver/$_pkgname-$pkgver.jar"
    "$_pkgname"
    "$_pkgname.desktop"
)
sha256sums=(
    '1170f5b9e8f13f7ba6c842348018a22d2d8ae08e228f8bd2daaf1b47143bc6f3'
    'e84d4d4b93eeb6be773fc558d8b0fc931245fd3bc38f5fff34342c8610357d2f'
    '51001957c7398f25218b3484523e744c5d6c42a3c94739ef5b80f294efce3fc1'
)

package() {
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}.jar" -t "${pkgdir}/usr/share/java/${pkgname}/"
    install -Dm755 "${srcdir}/${_pkgname}" -t "${pkgdir}/usr/bin/"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
}
