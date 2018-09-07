# Maintainer: Ilja Kocken <i.j.kocken at uu dot com>
pkgname=easotope-client
pkgver=20180218
pkgrel=2
pkgdesc="Client for making isotopes easy"
arch=('x86_64')
url="http://easotope.org"
license=('GPL3'
         'EPL'
         'custom:easotope')
depends=('gtk3')
source=("${url}/release/${pkgver}/${pkgname//-/_}_linux_x86_64.tar.gz"
	# HTML license converted to plaintext taken from
	# https://github.com/Easotope/easotope/blob/master/org.easotope.client/docs/en/license.html
	"LICENSE"
	# "https://github.com/Easotope/easotope/raw/master/org.easotope.client/icons/logo.ico"
	"https://github.com/Easotope/easotope/raw/master/org.easotope.client/images/logo.png"
	"${pkgname}.sh"
	"${pkgname}.desktop")
md5sums=('db052a657ebef6e0661ec00b22934823'
         '1b89e56ddb6254648c181b7aab8de233'
         '85b92ad8ed1d778b8a8eba0541b1d59e'
         '03f873d4be21190aa4b4d26becafd5e7'
         '2f695968419ab83fc2ba6fc7de412d6a')
package() {
    install -dm755 "${pkgdir}/opt/"
    cd "${srcdir}"
    cp -r "${pkgname//-/_}/" "${pkgdir}/opt/${pkgname}/"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
