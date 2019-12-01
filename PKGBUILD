# Maintainer: Mathias Walters <waltersm@protonmail.com>

pkgname=maptool-jar
_pkgname=MapTool
pkgver=1.5.7
pkgrel=2
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
    '5b98cbd1cca38d5ce3cb79d734b06ab74b6db95cce76542277bb077d8aeca167'
    'd5efe71f36259e9c78f7f01806b8b43eb8367cf90d26dcc029cbdbcedac86dbf'
    '4db045122b4dbb7ca04db3359faa6a991e7c5b7e222ff8ddacd1cbc4012fec3b'
)

package() {
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}.jar" -t "${pkgdir}/usr/share/java/${_pkgname}/"
    install -Dm755 "${srcdir}/${_pkgname}" -t "${pkgdir}/usr/bin/"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
}
