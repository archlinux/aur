# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: dcelasun
# Maintainer : David Phillips <dbphillipsnz gmail dot com>

pkgname=wkhtmltopdf-static
pkgver=0.12.6
pkgrel=2
pkgdesc="Shell utility to convert HTML to PDF using Webkit and Qt (upstream static build)"
arch=('i686' 'x86_64')
url="https://wkhtmltopdf.org/"
license=('GPL3')
conflicts=('wkhtmltopdf')
provides=("wkhtmltopdf=${pkgver}")
depends=('bzip2' 'expat' 'fontconfig' 'freetype2' 'gcc-libs' 'glib2' 'glibc' 'graphite' 'harfbuzz' 'libjpeg6-turbo' 'libpng' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxext' 'libxrender' 'openssl' 'pcre' 'zlib')
optdepends=('icu48: Rendering from HTML uses unicode character encoding')

# Debian packages are already stripped, so don't bother re-attempting
options=('!strip')
source_x86_64=("https://github.com/wkhtmltopdf/packaging/releases/download/${pkgver}-1/wkhtmltox_${pkgver}-1.buster_amd64.deb")
source_i686=("https://github.com/wkhtmltopdf/packaging/releases/download/${pkgver}-1/wkhtmltox_${pkgver}-1.buster_i386.deb")
sha256sums_i686=('70f9d119a74e26e350cfe75f0d9d13bda1476ab6642a01f63aa7074ec417956c')
sha256sums_x86_64=('3e7a93a2ae4a2dd5cccb1b7bcce0eb462c75f05efa314a29499dadfdc5ebc59e')

package() {
	tar -xJf data.tar.xz -C "${pkgdir}"

	cd "${pkgdir}"

	mkdir -p usr

	mv "usr/local/share/"* usr/share/
	rmdir usr/local/share
	mv "usr/local/"* usr/
	rmdir usr/local
}
