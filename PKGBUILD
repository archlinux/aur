# Maintainer: Nick Haghiri (n s dot hag hiri at G mail dot com)
pkgname=obinskit
pkgver=1.1.0
pkgrel=1
pkgdesc="ObinsKit for Anne Pro and Anne Pro 2"
arch=('x86_64')
url="http://en.obins.net/obinskit"
license=(custom)
groups=('')
depends=('desktop-file-utils' 'gconf' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libnotify' 'libxss' 'libxtst' 'nss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("http://releases.obins.net/occ/linux/tar/ObinsKit_${pkgver}_x64.tar.gz"
"deb_extra_files_obins.tar.gz")
sha256sums_x86_64=('bcd09c9b7072b20fdf6ce9f735ef88251865edd3590466be6787587208114de9'
'fb4b1b173c6d85a1c22d6e2de068d0e2aee346a2c191cc5b5d681c639c14f199')


package(){

	# Install the main files
	install -d "${pkgdir}/opt/${pkgname}"
	cp -a "${srcdir}/ObinsKit/." "${pkgdir}/opt/${pkgname}"
	install -d "${pkgdir}/usr"
	cp -a "${srcdir}/usr/." "${pkgdir}/usr"

	# Exec bit
	chmod 755 "${pkgdir}/opt/${pkgname}/obinskit"

	# License
	install -D -m644 "${pkgdir}/opt/obinskit/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-CHROMIUM"

	install -D -m644 "${pkgdir}/opt/obinskit/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-ELECTRON"

}
