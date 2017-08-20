# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
# Test URL: https://www.isign.io/chrome-extension-verify
pkgname=isign-chrome-signing
pkgver=1.2.2.0
pkgrel=1
pkgdesc="Google Chrome & Mozilla extension for using smartcards with isign.io"
url="https://www.isign.io/downloads"
depends=(openssl qt5-base)
arch=(i686 x86_64)
source_i686=("https://www.isign.io/repo/${pkgver%.*}/isign-chrome-signing-en-32_${pkgver}.deb")
source_x86_64=("https://www.isign.io/repo/${pkgver%.*}/isign-chrome-signing-en_${pkgver}.deb")
sha256sums_i686=('052573ff27120ad1492d9827b5d0467d3d0fb87b1d80967b1d446d9267a911ff')
sha256sums_x86_64=('2b27a88296e712f7d6a011daefd6ce8c0b99ac081bd80f40fafd361bef9c29f6')

prepare() {
	bsdtar xf data.tar.xz
}

package() {
	cp -av etc usr "$pkgdir"
	# OCD
	chmod -x "$pkgdir"/usr/share/*/*.json
}
