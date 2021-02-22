# Maintainer: Jay Ta'ala <jay@jaytaala.com>

pkgname=zoho-notebook
pkgver=1.2.0
pkgrel=1
pkgdesc="Zoho Notebook for Linux: Take notes, add files, create checklists, sketches, record audio, and capture moments."
arch=('x86_64')
url="https://www.zoho.com/notebook"
license=('custom')
depends=('gtk3' 'libsecret' 'dbus-x11' 'libxss' 'nss')
options=('!strip' '!emptydirs')
install=notebook.install
source=("https://downloads.zohocdn.com/notebooklinux-desktop/Notebook-${pkgver}.deb")
sha256sums=('f795bfd02c4f887735136eefd37ea19b075aee223309e727ea9f76970a8260c3')

package() {
	tar xf data.tar.xz -C "${pkgdir}"

	# install licenses
	install -D -m644 "${pkgdir}/opt/Notebook/resources/app.asar.unpacked/node_modules/sqlite3/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/opt/Notebook/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
	install -D -m644 "${pkgdir}/opt/Notebook/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
