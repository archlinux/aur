# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
# Test URL: https://www.isign.io/chrome-extension-verify
pkgname=isign-chrome-signing
pkgver=1.2.0.0
pkgrel=1
pkgdesc="Google Chrome extension for using smartcards with isign.io"
url="https://www.isign.io/downloads"
depends=(openssl qt5-base)
arch=(x86_64)
source_x86_64=("https://www.isign.io/repo/${pkgver%.*}/isign-chrome-signing-en_${pkgver}.deb")
sha256sums_x86_64=('bbc582b3c57d943466106c3ed255bf8c0807dd7f4dc4d0696b65ad42dac24b6c')

prepare() {
	bsdtar xf data.tar.xz
}

package() {
	cp -av etc usr "$pkgdir"
	# OCD
	chmod -x "$pkgdir"/usr/share/*/*.json
}
