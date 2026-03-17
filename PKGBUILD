# Maintainer: Alfredo Ramos <alfredo.ramos@proton.me>
# Maintainer: Jose Galvez (galvez_65)
# Contributor: Sabu Siyad <hello@ssiyad.com>
# Contributor: Hunter Wittenborn <hunter@hunterwittenborn.me>
# Contributor: Emerson Almeida <duke.m16@gmail.com>

pkgname=zoho-mail-desktop
pkgver=1.9.0
pkgrel=1
pkgdesc='Lite desktop version of Zoho email client.'
arch=('x86_64')
url='https://www.zoho.com/mail/desktop'
license=('custom')

depends=('hicolor-icon-theme')

source=("https://downloads.zohocdn.com/zmail-desktop/linux/${pkgname}-lite-installer-x64-v${pkgver}.deb")
sha512sums=('f6b4d82c27f6b1085d1d182f642e9653762bae88911deb35bba5eee0fe2391a1e3056c5d200e729a6ac12ba0394f70c76efede3f3350f780e7e1e165a1d70b0f')

package() {
	# Install application, icons, docs and desktop file
	tar -C "${pkgdir}" -xavf "${srcdir}/data.tar.xz"

	# Create symbolic link
	install -dm 755 "${pkgdir}/usr/bin"
	ln -sr "${pkgdir}/opt/Zoho Mail - Desktop/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# Install license
	install -Dm 644 "${pkgdir}/opt/Zoho Mail - Desktop/resources/EULA.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf"
}
