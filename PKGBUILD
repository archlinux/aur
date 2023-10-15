# Maintainer: Peter Gaede <peter-gaede@mail.de>
# Maintainer: Jay Ta'ala  <jay@jaytaala.com>
# Maintainer: Micah Waddoups <dev@micahwelf.us>

pkgname=zoho-notebook
pkgver=2.2.3
pkgrel=1
pkgdesc="Zoho Notebook for Linux: Take notes, add files, create checklists, sketches, record audio, and capture moments."
arch=('x86_64')
url="https://www.zoho.com/notebook"
license=('custom')
depends=('gtk3' 'libsecret' 'dbus' 'nss' 'python' 'alsa-lib' 'make')
options=('!strip' '!emptydirs')
install=notebook.install
source=("https://downloads.zohocdn.com/notebooklinux-desktop/Notebook-${pkgver}.deb")
sha256sums=('c9f4faf14c722fd549cd1be7ebd0424728af7ad2ceda246faadd76d2b83abaa1')

package() {
	tar xf data.tar.xz -C "${pkgdir}"

	# install licenses
	install -D -m644 "${pkgdir}/opt/Notebook/resources/app.asar.unpacked/node_modules/sqlite3/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/opt/Notebook/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
	install -D -m644 "${pkgdir}/opt/Notebook/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
