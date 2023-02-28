# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=inter-font-beta
pkgver=4.0beta7
pkgrel=1
pkgdesc='A typeface specially designed for user interfaces'
arch=(any)
url='https://rsms.me/inter/'
license=(custom:OFL)
provides=(inter-font)
conflicts=(inter-font)
_commit=4.0-beta7
source=("https://github.com/rsms/inter/releases/download/v${_commit}/Inter-${_commit}.zip")
noextract=("Inter-${_commit}.zip")
b2sums=('9409ed769de27fcbe86a242b6d3771d5e573ecf25f386e1880458f7af1f78fea1bce7cd78c208003b3b3b8eb2930635605f2847868398061ef5dc9a78ef75a55')

# Upstream dumps a *bunch* of stuff into the top level of the archive
prepare() {
	mkdir "inter-${_commit}"
	cd "inter-${_commit}"
	bsdtar xf ../Inter-${_commit}.zip
}

package() {
	cd "inter-${_commit}"
	install -d "${pkgdir}/usr/share/fonts/inter"
	install -m644 -t "${pkgdir}/usr/share/fonts/inter" 'Desktop with TrueType hints'/*.ttf
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
