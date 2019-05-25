pkgname=freedesktop-templates-libreoffice
pkgver=6.1.5_3
pkgrel=1
pkgdesc='LibreOffice Templates for the “Create New...” menu'
arch=('any')
license=('unknown')
depends=('dolphin' 'libreoffice')
source=("http://ftp.debian.org/debian/pool/main/libr/libreoffice/libreoffice-kde5_${pkgver/_/-}_amd64.deb")
sha256sums=('6673947a51e9c67caf2128098f56150b89611064468c47cbb6d95f540241b533')

prepare() {
	tar xf data.tar.xz
	# metainfo exists in libreoffice
	rm -rf ./usr/{lib,share/{appdata,bug,doc,metainfo}}
	sed -Ei 's/ *(\.{3})/\1/g; /\[de\]/d' ./usr/share/templates/*.desktop
}

package() {
	cp -r "$srcdir/usr" "$pkgdir/"
}
