# Maintainer:  oech3

pkgname=cursor-electron-latest
pkgver=0.49.6
pkgrel=4
pkgdesc="Desktop entry for Cursor with"
arch=('any')
url="https://www.cursor.com"
depends=(cursor-electron electron)
build() {
	sed -e "s|^Exec=.*|Exec=/usr/share/cursor/${pkgname}|" -e "s/^Name=.*/Name=${pkgname}/" /usr/share/applications/cursor.desktop > ${pkgname}.desktop
}
package(){
	install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
