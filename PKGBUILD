# Maintainer : djnk8 <djnk8@mailinator.com>
_host='Host: cdn.hancom.com'
_referer='Referer: https://www.hancom.com/cs_center'
DLAGENTS=("https::/usr/bin/curl -o %o -H ${_referer// /\\ } -H ${_host// /\\} %u")

pkgname='hoffice'
pkgver=11.20.0.1520
pkgrel=1
pkgdesc='Office document editor for Linux. Hancom Office Editor is an application to allow you to edit office documents that is developed and distributed by Hancom Inc.'
arch=('x86_64')
url='https://www.hancom.com/'
license=('custom:hoffice')
depends=('cairo' 'fontconfig' 'freetype2' 'gcc-libs' 'glibc' 'glu' 'harfbuzz' 'harfbuzz-icu' 'libcups' 'libcurl-gnutls' 'libxcb' 'qt5-base' 'qt5-x11extras' 'zlib')
optdepends=()
source=(
	'https://cdn.hancom.com/pds/hnc/DOWN/gooroom/hoffice_11.20.0.1520_amd64.deb'
	'license.txt'
)
sha256sums=(
	'SKIP'
	'09b74399a45cde2b28e672784dbd1eb6397454a025e05a51fb3367eadb834583'
)

package() {
	msg2 "Extracting Package binaries..."
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/hoffice/LICENSE"
}
