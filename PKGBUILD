# Maintainer: Ilja Kocken <i.j.kocken at uu dot com>
pkgname=easotope-client
pkgver=20180218
pkgrel=1
pkgdesc="Client for making isotopes easy"
arch=('x86_64')
url="http://easotope.org"
license=('GPL3'
         'EPL'
         'custom:easotope')
depends=('gtk3')
source=("${url}/release/${pkgver}/${pkgname//-/_}_linux_x86_64.tar.gz"
	"LICENSE"
	"icon.png"
	"${pkgname}.sh"
	"${pkgname}.desktop")
md5sums=('db052a657ebef6e0661ec00b22934823'
         '86ddc7fdc30acbb5146c9820c1b771f1'
         '35db741960c2d1edd88d3c4f2a47d028'
         '03f873d4be21190aa4b4d26becafd5e7'
         '2f695968419ab83fc2ba6fc7de412d6a')
package() {
    install -dm755 "${pkgdir}/opt/"
    cd "${srcdir}"
    cp -r "${pkgname//-/_}/" "${pkgdir}/opt/${pkgname}/"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
