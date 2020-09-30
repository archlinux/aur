# Maintainer: Copyright³ (unstartdev) <admin [at] n-a [dot] date>

pkgname=ttf-arphic-tex-extra
pkgver=20161212
pkgrel=1
pkgdesc="TrueType versions of the Chinese Arphic fonts for use with XeLaTeX and LuaLaTeX."
url="https://www.ctan.org/pkg/arphic-ttf"
depends=('fontconfig' 'xorg-font-util')
arch=('any')
license=('custom:ARPHIC_PUBLIC_LICENSE')
makedepends=('unzip')
source=('http://mirrors.ctan.org/fonts/arphic-ttf.zip')
noextract=("arphic-ttf.zip")
sha256sums=('1f2a2f979d35354f383851aa5631e38dda63f5995b309aa5da97679fd132de39')

prepare() {
	unzip -o arphic-ttf.zip
}

package() {
	_src="${srcdir}/arphic-ttf"
	_dest="${pkgdir}/usr/share/fonts/TTF"
	install -m 644 -D "${_src}/bkai00mp.ttf" "${_dest}/bkai00mp.ttf"
	install -m 644 -D "${_src}/bsmi00lp.ttf" "${_dest}/bsmi00lp.ttf"
	install -m 644 -D "${_src}/gbsn00lp.ttf" "${_dest}/gbsn00lp.ttf"
	install -m 644 -D "${_src}/gkai00mp.ttf" "${_dest}/gkai00lp.ttf"
	install -m 644 -D "${_src}/ARPHICPL.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
