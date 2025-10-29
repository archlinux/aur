# Maintainer: Alfredo Ramos <alfredo.ramos@proton.me>
# Contributor: Jose Galvez (galvez_65)
# Contributor: Sabu Siyad <hello@ssiyad.com>
# Contributor: Hunter Wittenborn <hunter@hunterwittenborn.me>
# Contributor: Emerson Almeida <duke.m16@gmail.com>

pkgname=zoho-mail-desktop
pkgver=1.7.1
pkgrel=1
pkgdesc='Lite desktop version of Zoho email client.'
arch=('x86_64')
url='https://www.zoho.com/mail/desktop'
license=('custom')

depends=('hicolor-icon-theme')

source=(
	"https://downloads.zohocdn.com/zmail-desktop/linux/${pkgname}-lite-installer-x64-v${pkgver}.deb"
)
sha512sums=('ff03604467aba279e6f47111981f9c3de7cc6123c894e01b3d65397da661b1f4dd591ae06d9da76345224a2f84f127cbe81894acd72e5339eb7da57d854a970c')

package() {
	# Install application, icons, docs and desktop file
	tar -C "${pkgdir}" -xavf "${srcdir}/data.tar.xz"

	# Create symbolic link
	install -dm 755 "${pkgdir}/usr/bin"
	ln -sr "${pkgdir}/opt/Zoho Mail - Desktop/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# Install license
	install -Dm 644 "${pkgdir}/opt/Zoho Mail - Desktop/resources/EULA.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf"
}
