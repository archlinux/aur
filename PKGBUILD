# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
# Test URL: https://www.isign.io/chrome-extension-verify
pkgname=isign-chrome-signing
pkgver=1.2.4.0
pkgrel=1
pkgdesc="Google Chrome & Mozilla extension for using smartcards with isign.io"
url="https://www.isign.io/downloads"
depends=(openssl-1.0 qt5-base)
arch=(i686 x86_64)
source_i686=("https://www.isign.io/repo/${pkgver%.*}/isign-chrome-signing-en-32_${pkgver}.deb")
source_x86_64=("https://www.isign.io/repo/${pkgver%.*}/isign-chrome-signing-en_${pkgver}.deb")
sha256sums_i686=('7fe42cbfb7da6a65a67b82f1a1bb8dcf0af40dda753e2602555fbe143553b5c3')
sha256sums_x86_64=('58d2bd963188bbd499e7046fc5c2271d2c083bd791a3f8bc2c37216b73853b95')

prepare() {
	bsdtar xf data.tar.xz
}

package() {
	cp -av etc usr "$pkgdir"
	# OCD
	chmod -x "$pkgdir"/usr/share/*/*.json
}
