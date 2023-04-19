# Maintainer: Nick Haghiri (n s dot hag hiri at G mail dot com)
pkgname=obinskit
pkgver=1.2.11
pkgrel=1
pkgdesc="ObinsKit for Anne Pro and Anne Pro 2"
arch=('x86_64')
url="http://en.obins.net/obinskit"
license=(custom)
depends=('desktop-file-utils' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libnotify' 'libxss' 'libxtst' 'nss' 'libxkbcommon-x11')
options=('!strip' '!emptydirs')
install=${pkgname}.install

DLAGENTS='https::/usr/bin/wget --referer https://www.hexcore.xyz/obinskit -N %u'

source_x86_64=("https://s3.hexcore.xyz/occ/linux/tar/ObinsKit_${pkgver}_x64.tar.gz"
"deb_extra_files_obins.tar.gz")
sha256sums_x86_64=('2a10aed5366c2667174525924da60e323b7e200e2aa9abc1c1a6335e792096cd'
'137296d606b8127dfda7626421fd17fbee06712678b7ae25793e51d78221fab5')


package(){

	# Install the main files
	install -d "${pkgdir}/opt/${pkgname}"
	cp -a "${srcdir}/ObinsKit_${pkgver}_x64/." "${pkgdir}/opt/${pkgname}"
	install -d "${pkgdir}/usr"
	cp -a "${srcdir}/usr/." "${pkgdir}/usr"

	# Exec bit
	chmod 755 "${pkgdir}/opt/${pkgname}/obinskit"

	# License
	install -D -m644 "${pkgdir}/opt/obinskit/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-CHROMIUM"

	install -D -m644 "${pkgdir}/opt/obinskit/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-ELECTRON"

}
