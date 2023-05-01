# Maintainer: Matthew McGinn <mamcgi@gmail.com>

pkgname=wxtoimg
pkgver=2.10.11
pkgrel=2
pkgdesc="Software to decode APT and WEFAX signals from weather satellites"
arch=('x86_64' 'i686')
url="https://www.wxtoimgrestored.xyz"
_github_url='none'
license=('custom')
depends=('libx11' 'sh')
provides=('wxtoimg' 'xwxtoimg')
source=("LICENSE")
source_x86_64=("https://wxtoimgrestored.xyz/downloads-src/${pkgname}-linux64-${pkgver}-1.tar.gz")
source_i686=("https://wxtoimgrestored.xyz/downloads-src/${pkgname}-linux-${pkgver}.tar.gz")

sha256sums=('9476211e68485904a59735602703573114f85044858e56eb8aba7834bb310f96')
sha256sums_x86_64=('11c3697dee53c42fd6e0bedcbdedc9f0da66aaa7e2cf22ae5d8b778e37a1a19e')
sha256sums_i686=('3a4866f112ff4865c2a842b3a5933645333830a40a60b4ea9558229117070493')

DLAGENTS='http::/usr/bin/wget -c -t 3 --waitretry=3 -O %o %u'

package() {
	mkdir -p "${pkgdir}/usr/"
	mkdir -p "${pkgdir}/usr/lib/${pkgname}"
	cp -r "${srcdir}/usr/local/bin/" "${pkgdir}/usr/"
	cp -r "${srcdir}/usr/local/lib/" "${pkgdir}/usr/lib/${pkgname}"
	install -Dm755 "${srcdir}/etc/X11/applnk/Applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	ln -nfs "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/xwxtoimg"
}
