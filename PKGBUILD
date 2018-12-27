# Maintainer: Darjan Krijan (daren) <darjan_krijan@gmx.de>

pkgname=xmltreeedit-bin
pkgver=0.1.0.32
pkgrel=1
pkgdesc="Basic cross-platform tree view XML editor"
arch=('x86_64')
license=('GPL3')
depends=('gtk2' 'gtk-engine-murrine')
url="https://sourceforge.net/projects/xmltreeeditor/"
install=xmltreeedit-bin.install
source=()

prepare() {
	wget -O xmltreeedit_${pkgver}_amd64.deb https://sourceforge.net/projects/xmltreeeditor/files/xmltreeedit_${pkgver}_amd64.deb/download
}

package() {
	ar x xmltreeedit_${pkgver}_amd64.deb
	tar -xf data.tar.xz -C "${pkgdir}"

	# Translation.xml: Bad naming for the /etc directory,
	# moving this to /usr/share/XMLTreeEdit to be optionally used
	mv "${pkgdir}/etc/Translation.xml" "${pkgdir}/usr/share/XMLTreeEdit/Translation.xml"

	# The file is executable for some reason
	chmod a-x "${pkgdir}/usr/share/XMLTreeEdit/Translation.xml"
}
