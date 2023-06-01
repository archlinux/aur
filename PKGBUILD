# Maintainer: Peter Gaede <peter-gaede@mail.com>
# Maintainer: Jay Ta'ala  <jay@jaytaala.com>

pkgname=zoho-notebook
pkgver=2.1.0
pkgrel=1
pkgdesc="Zoho Notebook for Linux: Take notes, add files, create checklists, sketches, record audio, and capture moments."
arch=('x86_64')
url="https://www.zoho.com/notebook"
license=('custom')
depends=('gtk3' 'libsecret' 'dbus' 'nss' 'python' 'alsa-lib' 'make')
options=('!strip' '!emptydirs')
install=notebook.install
source=("https://downloads.zohocdn.com/notebooklinux-desktop/Notebook-${pkgver}.deb")
sha256sums=('f1d5ce56d1c0324194b9e8ca4487bcc0f90a0fb600627e2343421b406b904abd')

package() {
	tar xf data.tar.xz -C "${pkgdir}"

	# install licenses
	install -D -m644 "${pkgdir}/opt/Notebook/resources/app.asar.unpacked/node_modules/sqlite3/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/opt/Notebook/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
	install -D -m644 "${pkgdir}/opt/Notebook/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
