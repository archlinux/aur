# Maintainer: Jay Ta'ala <jay@jaytaala.com>

pkgname=zoho-notebook
pkgver=1.2.1
pkgrel=1
pkgdesc="Zoho Notebook for Linux: Take notes, add files, create checklists, sketches, record audio, and capture moments."
arch=('x86_64')
url="https://www.zoho.com/notebook"
license=('custom')
depends=('gtk3' 'libsecret' 'dbus-x11' 'libxss' 'nss')
options=('!strip' '!emptydirs')
install=notebook.install
source=("https://downloads.zohocdn.com/notebooklinux-desktop/Notebook-${pkgver}.deb")
sha256sums=('5ec4b6c6b9dc18a8046812d05c4ba7a9e42b9716f2026a4123a3f42af74d9c0b')

package() {
	tar xf data.tar.xz -C "${pkgdir}"

	# install licenses
	install -D -m644 "${pkgdir}/opt/notebook/resources/app.asar.unpacked/node_modules/sqlite3/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/opt/notebook/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
	install -D -m644 "${pkgdir}/opt/notebook/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
