# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=zotero-beta
_pkgname=zotero-beta
pkgver=2021.04.28
pkgrel=1
pkgdesc="Zotero is a free, easy-to-use tool to help you collect, organize, cite, and share research."
arch=('x86_64')
url="https://github.com/retorquere/zotero-deb"
license=('AGPL3')
depends=(
	'aarch64-linux-gnu-gcc'
	'atk'
	'cairo'
	'dbus'
	'dbus-glib'
	'desktop-file-utils'
	'fontconfig'
	'freetype2'
	'gdk-pixbuf2'
	'glib2'
	'glibc'
	'gnupg'
	'gtk3'
	'harfbuzz'
	'hicolor-icon-theme'
	'libx11'
	'libxcb'
	'libxcomposite'
	'libxcursor'
	'libxdamage'
	'libxext'
	'libxfixes'
	'libxi'
	'libxrender'
	'libxt'
	'nss'
)
source=("https://github.com/retorquere/zotero-deb/releases/download/apt-get/zotero-beta_${pkgver}_amd64.deb")
sha256sums=('76d247566298b20ee7b328f03e5ac87bc125947f5671ccae53f3fc5d0cc12c30')

package() {
	tar -p -zxvf data.tar.gz -C "${pkgdir}"
	chmod 755 -R ../pkg/${pkgname}/usr
	
	# namcap does not like local
	cp -r ../pkg/${pkgname}/usr/local/* ../pkg/${pkgname}/usr/
	rm -r ../pkg/${pkgname}/usr/local
	
}
