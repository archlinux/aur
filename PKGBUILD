# Maintainer: Alfredo Ramos <alfredo.ramos@skiff.com>
# Contributor: Jose Galvez (galvez_65)
# Contributor: Sabu Siyad <hello@ssiyad.com>
# Contributor: Hunter Wittenborn <hunter@hunterwittenborn.me>
# Contributor: Emerson Almeida <duke.m16@gmail.com>

pkgname=zoho-mail-desktop
pkgver=1.6.4
pkgrel=1
pkgdesc='Lite desktop version of Zoho email client.'
arch=('x86_64')
url='https://www.zoho.com/mail/desktop'
license=('custom')

depends=('hicolor-icon-theme')

source=(
	"https://downloads.zohocdn.com/zmail-desktop/linux/${pkgname}-lite-installer-x64-v${pkgver}.deb"
)
sha512sums=('aeccb3543ef946dbad8a1de3103920c3084837f5dfe1b2660ad5dccab85317218536aaf5ccb4b4dfdb23114323e34c5564d3fb15d07145c1c2bb5bd214655d1c')

package() {
	# Install application, icons, docs and desktop file
	tar -C "${pkgdir}" -xavf "${srcdir}/data.tar.xz"

	# Create symbolic link
	install -dm 755 "${pkgdir}/usr/bin"
	ln -sr "${pkgdir}/opt/Zoho Mail - Desktop/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# Install license
	install -Dm 644 "${pkgdir}/opt/Zoho Mail - Desktop/resources/EULA.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf"
}
