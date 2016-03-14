pkgname=isign-chrome-signing
pkgver=1.0.2.0
pkgrel=1
pkgdesc="Google Chrome extension for using smartcards with isign.io"
url="https://www.isign.io/downloads"
depends=(openssl qt5-base)
arch=(i686 x86_64)
source_i686=("https://www.isign.io/repo/isign-chrome-signing-en-32_1.0.2.0.deb")
source_x86_64=("https://www.isign.io/repo/isign-chrome-signing-en_${pkgver}.deb")
sha256sums_i686=('b6635688a4db3cabeda376ae2295984827c9f614fb686eb8b3a2fc75cc744352')
sha256sums_x86_64=('5e78168896601ce1cec504e4fe77b46575b5409f360bb0c9ae40a51ff0e83f51')

prepare() {
	bsdtar xf data.tar.xz
}

package() {
	cp -av etc usr "$pkgdir"
	# OCD
	chmod -x "$pkgdir"/usr/share/*/*.json
}
