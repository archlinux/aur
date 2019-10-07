# Maintainer: Mathias Walters <waltersm@protonmail.com>

pkgname=maptool-jar
_pkgname=MapTool
pkgver=1.5.6
pkgrel=1
pkgdesc="An open source virtual tabletop program"
arch=('x86_64')
url="https://rptools.net/tools/maptool"
license=('AGPL3')
depends=('jre10')
provides=('maptool')
conflicts=('maptool')
source=("https://github.com/RPTools/maptool/releases/download/$pkgver/$_pkgname-$pkgver.jar" "$_pkgname" "$_pkgname.desktop")
sha256sums=('4bfe636b0ea93f5ca31152934f9a05ecbdc703da49d251eb7162b750f3518b3e' '71f160a65b68440870e1f59493bf7f6c0369007e5c41596f42e1f5e7d4863ef2' 'c83d0a79c1e91713bd25cb07174de64638c44bdd082bd86dfe2605bad66c7b87')

package() {
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}.jar" -t "${pkgdir}/usr/share/java/${_pkgname}/"
    install -Dm755 "${srcdir}/${_pkgname}" -t "${pkgdir}/usr/bin/"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
}
