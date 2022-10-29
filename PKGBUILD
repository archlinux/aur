# Maintainer: Jay Ta'ala <jay@jaytaala.com>

pkgname=zoho-notebook
pkgver=2.0.1
pkgrel=1
pkgdesc="Zoho Notebook for Linux: Take notes, add files, create checklists, sketches, record audio, and capture moments."
arch=('x86_64')
url="https://www.zoho.com/notebook"
license=('custom')
depends=('gtk3' 'libsecret' 'dbus' 'libxss' 'nss')
options=('!strip' '!emptydirs')
install=notebook.install
source=("https://downloads.zohocdn.com/notebooklinux-desktop/Notebook-${pkgver}.deb")
sha256sums=('e961f7e896adcd8647dc1eab5eaf1c18a1c5876ae72c1c21c6432a8c42dc3875')

package() {
	tar xf data.tar.xz -C "${pkgdir}"

	# install licenses
	install -D -m644 "${pkgdir}/opt/Notebook/resources/app.asar.unpacked/node_modules/sqlite3/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/opt/Notebook/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
	install -D -m644 "${pkgdir}/opt/Notebook/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
