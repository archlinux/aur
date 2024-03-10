# Maintainer: Joost Bremmer < toost dot b at gmail dot com>
pkgname=iographica
pkgver=1.0.3
pkgrel=1
pkgdesc="an application that turns mouse movements into modern art"
arch=(any)
url="http://iographica.com/"
license=('custom')
depends=('java-runtime'
'desktop-file-utils')
source=("${pkgname}" 
"${pkgname}.desktop"
"${pkgname}.png"
"${pkgname}.jar::https://github.com/anatolyzenkov/IOGraph/releases/download/v1.0.3/IOGraph_v1_0_3.jar")
noextract=(${pkgname}.jar)
conflicts=("iograph")
sha256sums=('d248d89663710e486ede5eafad02352ef739649132499ef338c80c9472b72dd7'
            '9625acb9e461c43c9c8c41451bf34ec7d674f2a172305d26c193cb30a2154245'
            '72ef426162886d3ee3f298a967c399f94aec560dba1cb76b476295e6c1dc64bf'
            'fb31adb82b89df3e85137ae3a2540b0da69cf2bdaa2576ed2bdbacab45fb4205')

package() {
	cd "$srcdir/"

        #executables
	install -D -m755 "${srcdir}/iographica"         "${pkgdir}/usr/bin/iographica"
	install -D -m644 "${srcdir}/${pkgname}.jar"     "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"

        #desktop files
	install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m644 "${srcdir}/${pkgname}.png"     "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	
}
