# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

pkgname=xmltreeedit-bin
pkgver=0.1.0.35
pkgrel=1
pkgdesc="Basic cross-platform tree view XML editor"
arch=('x86_64')
license=('GPL3')
depends=('gtk2' 'gtk-engine-murrine')
url="https://sourceforge.net/projects/xmltreeeditor/"
source=("xmltreeedit-gtk2_${pkgver}_amd64.deb::https://sourceforge.net/projects/xmltreeeditor/files/xmltreeedit-gtk2_${pkgver}_amd64.deb/download")
sha256sums=("fcbc61c21824ec20d176e69a6d8453d7775f3ebb4719bf4dbf082c21fc167311")

package() {
	ar x xmltreeedit-gtk2_${pkgver}_amd64.deb
	tar -xf data.tar.xz -C "${pkgdir}"

	# Translation.xml: Bad generic naming for the /etc directory,
	# moving this to /usr/share/XMLTreeEdit to be optionally used
	mv "${pkgdir}/etc/Translation.xml" "${pkgdir}/usr/share/XMLTreeEdit/Translation.xml"

	# The file is executable for some reason
	chmod a-x "${pkgdir}/usr/share/XMLTreeEdit/Translation.xml"
}
