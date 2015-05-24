# Maintainer: Joost Bremmer < toost dot b at gmail dot com>
pkgname=iographica
pkgver=1.0.1
pkgrel=2
pkgdesc="an application that turns mouse movements into modern art"
arch=(any)
url="http://iographica.com/"
license=('custom')
depends=('java-runtime'
'desktop-file-utils')
source=("${pkgname}" 
"${pkgname}.desktop"
"${pkgname}.png"
"${pkgname}.jar"::http://iographica.com/download/linux/IOGraph_v1_0_1.jar)
noextract=(${pkgname}.jar)
conflicts=("iograph")
install="${pkgname}.install"
sha256sums=('d248d89663710e486ede5eafad02352ef739649132499ef338c80c9472b72dd7'
            '9625acb9e461c43c9c8c41451bf34ec7d674f2a172305d26c193cb30a2154245'
            '72ef426162886d3ee3f298a967c399f94aec560dba1cb76b476295e6c1dc64bf'
            'aa32de758a1a076d5a14461216b3298f60ae99650f7b3b314224c6c792b35cac')
package() {
	cd "$srcdir/"

        #executables
	install -D -m755 "${srcdir}/iographica"         "${pkgdir}/usr/bin/iographica"
	install -D -m644 "${srcdir}/${pkgname}.jar"     "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"

        #desktop files
	install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m644 "${srcdir}/${pkgname}.png"     "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	
}
