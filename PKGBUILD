# Maintainer: Mathias Walters <waltersm@protonmail.com>

pkgname=maptool-jar
_pkgname=MapTool
pkgver=1.5.14
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
    '897e81a38269d73cc7f5579f10cd27e4fe635664b51774337955d02fac85bbed'
    '610ffd008b25736ea1ba78d44131473783b46a41691b617b26f137ca7bdf0e8d'
    '4db045122b4dbb7ca04db3359faa6a991e7c5b7e222ff8ddacd1cbc4012fec3b'
)

package() {
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}.jar" -t "${pkgdir}/usr/share/java/${_pkgname}/"
    install -Dm755 "${srcdir}/${_pkgname}" -t "${pkgdir}/usr/bin/"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
}
