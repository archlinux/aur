## Maintainer: realasking
pkgname=readpdf-git
pkgver=0.2
pkgrel=2
pkgdesc='A simple script for pdf reading on tty / CLI, framebuffer, fbi and poppler are needed.'
arch=(x86_64 i686)
url='https://github.com/realasking/tty_pdf_reading'
license=('GPLv3')
depends=('poppler' 'fbida')
source=()
md5sums=()

_proj=https://github.com/realasking/tty_pdf_reading.git 
_name=tty_pdf_reading

prepare() {
	cd "${srcdir}"
	msg "Starting Git..."
	if [[ -d "$_proj" ]]; then
		cd "$_proj"
		git pull origin
	else
		git clone "$_proj" "$_name"
	fi
	msg "Project synchronization Finished."
}

package() {
	cd "$srcdir/$_name"
	install -Dm755 readpdf.sh "${pkgdir}/usr/bin/readpdf"
}
