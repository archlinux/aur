# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: dcelasun
# Maintainer : David Phillips <dbphillipsnz gmail dot com>
 
pkgname=wkhtmltopdf-static
pkgver=0.12.5
pkgrel=1
pkgdesc="Shell utility to convert HTML to PDF using Webkit and Qt (upstream static build)"
arch=('i686' 'x86_64')
url="https://wkhtmltopdf.org/"
license=('GPL3')
conflicts=('wkhtmltopdf')
provides=("wkhtmltopdf=${pkgver}")
depends=('bzip2' 'expat' 'fontconfig' 'freetype2' 'gcc-libs' 'glib2' 'glibc' 'graphite' 'harfbuzz' 'libjpeg-turbo' 'libpng' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxext' 'libxrender' 'pcre' 'zlib')
optdepends=('icu48: Rendering from HTML uses unicode character encoding')

# Debian packages are already stripped, so don't bother re-attempting
options=('!strip')
source_x86_64=("https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/${pkgver}/wkhtmltox_${pkgver}-1.bionic_amd64.deb")
source_i686=("https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/${pkgver}/wkhtmltox_${pkgver}-1.bionic_i386.deb")
sha256sums_x86_64=('db48fa1a043309c4bfe8c8e0e38dc06c183f821599dd88d4e3cea47c5a5d4cd3')
sha256sums_i686=('1f5ac84c1cb25e385b49b94a04807d60bf73da217bc6c9fe2cbd1f0a61d33f63')

package() {
	tar -xJf data.tar.xz -C "${pkgdir}"

	cd "${pkgdir}"

	mkdir -p usr

	mv "usr/local/share/"* usr/share/
	rmdir usr/local/share
	mv "usr/local/"* usr/
	rmdir usr/local
}
