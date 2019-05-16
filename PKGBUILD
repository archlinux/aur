pkgname=freedesktop-templates-libreoffice
pkgver=6.1.5
pkgrel=1
pkgdesc='LibreOffice Templates for the “Create New...” menu'
arch=('any')
license=('unknown')
depends=('dolphin' 'libreoffice')
source=("http://ftp.debian.org/debian/pool/main/libr/libreoffice/libreoffice-kde5_$pkgver~rc1-2_amd64.deb")
sha256sums=('345fb6a8b9a51303aa13b01fdf8b575ae5f391d22f7447d57a35113b52318cad')

prepare() {
	tar xf data.tar.xz
	# metainfo exists in libreoffice
	rm -rf ./usr/{lib,share/{appdata,bug,doc,metainfo}}
	sed -Ei 's/ *(\.{3})/\1/g; /\[de\]/d' ./usr/share/templates/*.desktop
}

package() {
	cp -r "$srcdir/usr" "$pkgdir/"
}
