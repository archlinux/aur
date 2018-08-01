# Maintainer: visitant0226 <visitant0226@gmail.com>
# Maintainer: super13 <fangguikai@163.com>
pkgname=listen1
pkgver=1.8.0
pkgrel=1
pkgdesc="One for all free music in China"
arch=('x86_64')
url="https://listen1.github.io/listen1/"
license=('MIT')
depends=()
source=("https://github.com/listen1/listen1_desktop/releases/download/v${pkgver}/Listen1_${pkgver}_linuxx64.tar.gz")
md5sums=('9abe90afa87b253bba9904b35635caa8')

package() {
	mkdir -p "${pkgdir}/usr/bin/"
	mkdir -p "${pkgdir}/opt/"
    mkdir -p "${pkgdir}/usr/share/pixmaps"
    mkdir -p "${pkgdir}/usr/share/applications/"
	touch "${pkgdir}/usr/share/applications/listen1.desktop"
	
	cp -r "${srcdir}/Listen1_${pkgver}_linuxx64" "${pkgdir}/opt/${pkgname}"
	ln -s "/opt/${pkgname}/listen1" "${pkgdir}/usr/bin/listen1"
	echo "[Desktop Entry]
Encoding=UTF-8
Name=listen1
Comment=One for all free music in China
Exec=/usr/bin/listen1
Icon=listen1.png
Terminal=false
Type=Application
Categories=Application;music" \
        >> "${pkgdir}/usr/share/applications/listen1.desktop"
    cp "${srcdir}/Listen1_${pkgver}_linuxx64/resources/app/resources/logo.png" "${pkgdir}/usr/share/pixmaps/listen1.png"
}
