# Maintainer: StuckUpCreations <onelove.nyahbingi@gmail.com>
pkgname=ct-js-bin
pkgver=1.4
pkgrel=1
pkgdesc="CTjs is a 2D game editor that makes its bet on good documentation, visual tools and smooth workflow"
arch=("x86_64")
url="https://ctjs.rocks/"
license=('MIT')
depends=()
makedepends=()
optdepends=()
provides=(CTjs)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/ct-js/ct-js/releases/download/v1.4.0/ct.js.v1.4.0.for.linux64.zip")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

package() {
	install -d ${pkgdir}/opt/ctjs
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/icons/
	mkdir -p ${pkgdir}/usr/share/applications/
	mv ${srcdir}/linux64/data/fonts/OpenSans\ –\ LICENSE.txt ${srcdir}/linux64/data/fonts/OpenSansLicense.txt
	touch ${srcdir}/linux64/ctjs.sh
	echo "#!/bin/bash" >> ${srcdir}/linux64/ctjs.sh
	echo "cd /opt/ctjs/" >> ${srcdir}/linux64/ctjs.sh
	echo "./ctjs" >> ${srcdir}/linux64/ctjs.sh
	chmod +x ${srcdir}/linux64/ctjs.sh
	touch ${pkgdir}/usr/share/applications/ctjs.desktop
	echo "[Desktop Entry]" >>  ${pkgdir}/usr/share/applications/ctjs.desktop
	echo "Type=Application" >> ${pkgdir}/usr/share/applications/ctjs.desktop
	echo "Version=1.3.1" >> ${pkgdir}/usr/share/applications/ctjs.desktop
	echo "Name=CTjs" >> ${pkgdir}/usr/share/applications/ctjs.desktop
	echo "Comment=CTjs is a 2D game editor that makes its bet on good documentation, visual tools and smooth workflow" >> ${pkgdir}/usr/share/applications/ctjs.desktop
	echo "Path=/opt/" >> ${pkgdir}/usr/share/applications/ctjs.desktop
	echo "Exec=ctjs" >> ${pkgdir}/usr/share/applications/ctjs.desktop
	echo "Icon=/usr/share/icons/ct_ide.png" >> ${pkgdir}/usr/share/applications/ctjs.desktop
	echo "Terminal=false" >> ${pkgdir}/usr/share/applications/ctjs.desktop
	echo "Categories=Development;" >> ${pkgdir}/usr/share/applications/ctjs.desktop
	cp -r ${srcdir}/linux64/* ${pkgdir}/opt/ctjs
	cp ${pkgdir}/opt/ctjs/ct_ide.png ${pkgdir}/usr/share/icons/ct_ide.png
	ln -s /opt/ctjs/ctjs.sh ${pkgdir}/usr/bin/ctjs
}
