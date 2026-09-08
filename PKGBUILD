# Maintainer: StuckUpCreations <onelove.nyahbingi@gmail.com>
pkgname=gfie-bin
pkgver=3.6
pkgrel=3
pkgdesc="Greenfish Icon Editor Pro (GFIE Pro) is a powerful open source image editor, especially suitable for creating icons, cursors, animations and icon libraries."
arch=("x86_64")
url="http://greenfishsoftware.org/gfie.php"
license=('custom')
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://greenfishsoftware.org/dl/gfie/gfie3.6_linux.zip")
noextract=()
md5sums=('a667349fcc2b179e5c0b59acaa5f6c74')
validpgpkeys=()

package() {
	install -d ${pkgdir}/opt/gfie
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/icons/
	mkdir -p ${pkgdir}/usr/share/applications/
	touch ${pkgdir}/usr/bin/gfie
	echo "#!/bin/bash" >>${pkgdir}/usr/bin/gfie
	echo "cd /opt/gfie" >>${pkgdir}/usr/bin/gfie
	echo "./gfie.sh" >>${pkgdir}/usr/bin/gfie
	chmod +x ${pkgdir}/usr/bin/gfie
	touch ${pkgdir}/usr/share/applications/gfie.desktop
	echo "[Desktop Entry]" >>${pkgdir}/usr/share/applications/gfie.desktop
	echo "Type=Application" >>${pkgdir}/usr/share/applications/gfie.desktop
	echo "Version=1.0" >>${pkgdir}/usr/share/applications/gfie.desktop
	echo "Name=GreenFish Icon Editor Pro" >>${pkgdir}/usr/share/applications/gfie.desktop
	echo "Comment=Greenfish Icon Editor Pro (GFIE Pro) is a powerful open source image editor, especially suitable for creating icons, cursors, animations and icon libraries." >>${pkgdir}/usr/share/applications/gfie.desktop
	echo "Path=/opt/" >>${pkgdir}/usr/share/applications/gfie.desktop
	echo "Exec=/opt/gfie/gfie.sh" >>${pkgdir}/usr/share/applications/gfie.desktop
	echo "Icon=/usr/share/icons/gfie_icon.png" >>${pkgdir}/usr/share/applications/gfie.desktop
	echo "Terminal=false" >>${pkgdir}/usr/share/applications/gfie.desktop
	echo "Categories=Graphics;" >>${pkgdir}/usr/share/applications/gfie.desktop
	cp -r ${srcdir}/Greenfish\ Icon\ Editor\ Pro\ 3.6/* ${pkgdir}/opt/gfie
	cp ${pkgdir}/opt/gfie/gfie_icon.png ${pkgdir}/usr/share/icons/gfie_icon.png
}
