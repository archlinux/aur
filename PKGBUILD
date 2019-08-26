pkgname='blackarch-menus-extended'
pkgver='0.2'
pkgrel=2
pkgdesc="BlackArch specific XDG-compliant menu with more desktop files."
arch=('any')
url="https://github.com/xeyqe/blackarch-menus-extended"
license=('GPL')
depends=('xdg-utils' 'fakeroot' 'gksu')
provides=('blackarch-menus')
conflicts=('blackarch-menus')
replaces=('blackarch-menus')
source=("https://codeload.github.com/xeyqe/blackarch-menus-extended/zip/master")
md5sums=('9215aefe0315f8846d552bd2786b4b71')


package() {
	cd "${pkgname}-master"

	install -m755 -d "${pkgdir}/etc/xdg/menus/applications-merged"
	install -m755 -d "${pkgdir}/usr/share/applications"
	install -m755 -d "${pkgdir}/usr/share/desktop-directories"
	install -m755 -d "${pkgdir}/usr/local/bin"
	install -dm 755 "$pkgdir/usr/share/icons/hicolor/32x32/apps"


	install -m644 directories/X-BlackArch.menu "${pkgdir}/etc/xdg/menus/applications-merged/"
	install -m644 directories/*.directory "${pkgdir}/usr/share/desktop-directories/"
	install -m644 desktop_files/*.desktop "${pkgdir}/usr/share/applications/"
	install -m755 blackarch-menu-scripts/appHelper.sh "${pkgdir}/usr/local/bin"
	install -m 644 directories/*.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/"
}
