# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=inter-font-beta
pkgver=4.0beta9h
pkgrel=1
pkgdesc='A typeface specially designed for user interfaces'
arch=(any)
url='https://rsms.me/inter/'
license=(custom:OFL)
provides=(inter-font)
conflicts=(inter-font)
_commit=4.0-beta9h
source=("https://github.com/rsms/inter/releases/download/v${_commit}/Inter-${_commit}.zip")
noextract=("Inter-${_commit}.zip")
b2sums=('SKIP')

# Upstream dumps a *bunch* of stuff into the top level of the archive
prepare() {
	mkdir "inter-${_commit}"
	cd "inter-${_commit}"
	bsdtar xf ../Inter-${_commit}.zip
}

package() {
	cd "inter-${_commit}"
	install -d "${pkgdir}/usr/share/fonts/inter"
	install -m644 -t "${pkgdir}/usr/share/fonts/inter" 'extras/ttf/'*.ttf
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
