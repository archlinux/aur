# Contributor: Sebastian Wolf <fatmike303 at gmail dot com>
pkgname=droid64
_pkgname=droiD64
pkgver=0.05b
pkgrel=1
pkgdesc='A graphical filemanager for D64 files (Commodore 64 and others)'
arch=(any)
url=http://droid64.sourceforge.net
license=('GPL2')
depends=('java-runtime' 'vlc' 'mplayer')
optdepends=('vice')
source=(
    http://prdownloads.sourceforge.net/${pkgname}/${_pkgname}-${pkgver}-bin.jar
	http://${pkgname}.sourceforge.net/data/${_pkgname}_icons.tar.gz
)
md5sums=(358baed4fb8003dde1f010b1e7ce0f88 192bdd2f5ba6b1a1fcb197eb435da958)

package() {
	mkdir -p ${pkgdir}/usr/bin/
	cat > ${pkgdir}/usr/bin/${pkgname} << EOF
#!/bin/sh
java -jar /usr/lib/${pkgname}/${_pkgname}-${pkgver}-bin.jar
EOF
	chmod +x ${pkgdir}/usr/bin/${pkgname}

    install -Dm644 ${_pkgname}-${pkgver}-bin.jar ${pkgdir}/usr/lib/${pkgname}/${_pkgname}-${pkgver}-bin.jar
    install -Dm644 ${srcdir}/${_pkgname}_icons/${_pkgname}_Icon.xpm ${pkgdir}/usr/share/pixmaps/${pkgname}.xpm
    install -Dm644 ${startdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
