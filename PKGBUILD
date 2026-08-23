# Maintainer: Alfredo Ramos <alfredo.ramos@proton.me>
# Maintainer: Jose Galvez (galvez_65)
# Contributor: Sabu Siyad <hello@ssiyad.com>
# Contributor: Hunter Wittenborn <hunter@hunterwittenborn.me>
# Contributor: Emerson Almeida <duke.m16@gmail.com>

pkgname=zoho-mail-desktop
pkgver=1.10.3
pkgrel=1
pkgdesc='Lite desktop version of Zoho email client.'
arch=('x86_64')
url='https://www.zoho.com/mail/desktop'
license=('custom')

depends=('hicolor-icon-theme')

source=("https://downloads.zohocdn.com/zmail-desktop/linux/${pkgname}-lite-installer-x64-v${pkgver}.deb")
sha512sums=('1b911aef1fdbadd465f9a35bfefddd9c20d5b0ac7f5e2a8b3cad70982378a7ad56a8bf9c575813d9e3aa8b30c1374ec0fcfe2fc4c1547fbcbf9c7259b71be4d8')

package() {
	# Install application, icons, docs and desktop file
	tar -C "${pkgdir}" -xavf "${srcdir}/data.tar.xz"

	# Create symbolic link
	install -dm 755 "${pkgdir}/usr/bin"
	ln -sr "${pkgdir}/opt/Zoho Mail - Desktop/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# Install license
	install -Dm 644 "${pkgdir}/opt/Zoho Mail - Desktop/resources/EULA.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf"
}
