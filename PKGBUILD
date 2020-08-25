pkgname=freedesktop-templates-libreoffice
pkgver=6.4.5_1~bpo10+1
pkgrel=1
pkgdesc='LibreOffice Templates for the “Create New...” menu'
arch=('any')
license=('unknown')
depends=('dolphin' 'libreoffice')
source=("http://ftp.debian.org/debian/pool/main/libr/libreoffice/libreoffice-plasma_${pkgver/_/-}_amd64.deb")
sha256sums=('31e5902ae9185deae6aa44ab06e33fcf67ca3d956657ae2c1f2a5476c49b577e')

prepare() {
	tar xf data.tar.xz
	# metainfo exists in libreoffice
	rm -rf ./usr/{lib,share/{appdata,bug,doc,metainfo}}
	sed -Ei 's/ *(\.{3})/\1/g; /\[de\]/d' ./usr/share/templates/*.desktop
}

package() {
	cp -r "$srcdir/usr" "$pkgdir/"
}
