# Maintainer: Alfredo Ramos <alfredo.ramos@skiff.com>
# Contributor: Jose Galvez (galvez_65)
# Contributor: Sabu Siyad <hello@ssiyad.com>
# Contributor: Hunter Wittenborn <hunter@hunterwittenborn.me>
# Contributor: Emerson Almeida <duke.m16@gmail.com>

pkgname=zoho-mail-desktop
pkgver=1.6.3
pkgrel=1
pkgdesc='Lite desktop version of Zoho email client.'
arch=('x86_64')
url='https://www.zoho.com/mail/desktop'
license=('custom')

depends=('hicolor-icon-theme')

source=(
	"https://downloads.zohocdn.com/zmail-desktop/linux/${pkgname}-lite-installer-x64-v${pkgver}.deb"
)
sha512sums=(
	'8f9d6bf41f3dee3602c700e0e0483c6f0ff535b9392ca196c071ea6aa9528d8d369ebf79121856284d86b5fa77572fdeec6d1e5de36b780323b8cef38a03e0d1'
)

package() {
	# Install application, icons, docs and desktop file
	tar -C "${pkgdir}" -xavf "${srcdir}/data.tar.xz"

	# Create symbolic link
	install -dm 755 "${pkgdir}/usr/bin"
	ln -sr "${pkgdir}/opt/Zoho Mail - Desktop/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# Install license
	install -Dm 644 "${pkgdir}/opt/Zoho Mail - Desktop/resources/EULA.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf"
}
