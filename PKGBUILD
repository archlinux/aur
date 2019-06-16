# Maintainer: Nick Haghiri (n s dot hag hiri at G mail dot com)
pkgname=obinslab-starter
pkgver=1.0.11
pkgrel=1
pkgdesc="Obinslab Starter for Anne Pro and Anne Pro 2"
arch=('x86_64')
url="http://en.obins.net/obinslab-starter"
license=(custom)
groups=('')
depends=('desktop-file-utils' 'gconf' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libnotify' 'libxss' 'libxtst' 'nss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("http://releases.obins.net/occ/linux/tar/ObinslabStarter_${pkgver}_x64.tar.gz"
"deb_extra_files_obins.tar.gz")
sha256sums_x86_64=('00e5d37cbbee1b43ac825d162b4c8092c41dcf70c5f94bd456477e48eb04f75a'
'c1d61e5b9ec27236fc506e7cf5d1748a1d5b02ebf966fc7b0a0089672b287801')


package(){

	# Install the main files
	install -d "${pkgdir}/opt/${pkgname}"
	cp -a "${srcdir}/Obinslab-Starter-v${pkgver}/." "${pkgdir}/opt/${pkgname}"
	install -d "${pkgdir}/usr"
	cp -a "${srcdir}/usr/." "${pkgdir}/usr"

	# Exec bit
	chmod 755 "${pkgdir}/opt/${pkgname}/obinslab-starter"

	# License
	install -D -m644 "${pkgdir}/opt/obinslab-starter/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-CHROMIUM"

	install -D -m644 "${pkgdir}/opt/obinslab-starter/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-ELECTRON"

}
