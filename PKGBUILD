# Maintainer: Nick Haghiri (n s dot hag hiri at G mail dot com)
pkgname=obinskit
pkgver=1.1.2
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
sha256sums_x86_64=('157a2e2706705f7738811d7cec0c4052c816a317f0a4597e10c30a07d67842f0'
'e4ccd0755f753e6f333871e5d7ac765160e154e7be17a75556f0b8e927452f8c')


package(){

	# Install the main files
	install -d "${pkgdir}/opt/${pkgname}"
	cp -a "${srcdir}/ObinsKit_${pkgver}/." "${pkgdir}/opt/${pkgname}"
	install -d "${pkgdir}/usr"
	cp -a "${srcdir}/usr/." "${pkgdir}/usr"

	# Exec bit
	chmod 755 "${pkgdir}/opt/${pkgname}/obinskit"

	# License
	install -D -m644 "${pkgdir}/opt/obinskit/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-CHROMIUM"

	install -D -m644 "${pkgdir}/opt/obinskit/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-ELECTRON"

}
