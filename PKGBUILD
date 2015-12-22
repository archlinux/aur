# Contributor: Sebastian Wolf <fatmike303 at gmail dot com>
pkgname=droid64
_pkgname=droiD64
pkgver=0.065b
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
sha256sums=(
    e8c77b0087933cc972640ad27cab7024ef9fe487f0a8d5b3acea3f21b20beb90
    2f1315b3ea0b3f3ee3b605e16e3f0dc5c29a043a2e03477cefad085927f8fe90
)

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
