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
source=(
	'https://cdn.hancom.com/pds/hnc/DOWN/gooroom/hoffice_11.20.0.1520_amd64.deb'
	'LICENSE'
)
sha256sums=(
	'1ecb2f82e915b49706d1f5f6d206f8bd4a9384fda2bd56798c94046865fe5730'
	'09b74399a45cde2b28e672784dbd1eb6397454a025e05a51fb3367eadb834583'
)

package() {
	msg2 "Extracting package binaries(data.tar.xz)..."
	bsdtar -xf ${srcdir}/data.tar.xz -C "${pkgdir}/"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/hoffice/LICENSE" ${srcdir}/LICENSE
	msg2 "The error messages are from UTF-8 limitations. Please ignore it, as it does no harm."
	sleep 5
}
