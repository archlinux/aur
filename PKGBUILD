# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
# Test URL: https://www.isign.io/chrome-extension-verify
pkgname=isign-chrome-signing
pkgver=1.2.8.0
pkgrel=1
pkgdesc="Google Chrome & Mozilla native smartcard plugin for Dokobit (previously isign.io & app.digidoc.ee)"
url="https://www.dokobit.com/downloads"
depends=(openssl-1.0 qt5-base)
arch=(i686 x86_64)
source_i686=("https://www.isign.io/repo/${pkgver%.*}/isign-chrome-signing-en-32_${pkgver}.deb")
source_x86_64=("https://www.isign.io/repo/${pkgver%.*}/isign-chrome-signing-en_${pkgver}.deb")
sha256sums_i686=('98865a83c5068249b0ecd70111f5a01717d27a5dce7e0f6ffe95404ed6a8ca64')
sha256sums_x86_64=('d02e64fae567c34849a7db569c7c61504c883ad1723a20ab7894f7382c2549b3')

prepare() {
	bsdtar xf data.tar.xz
}

package() {
	cp -av etc usr "$pkgdir"
	# OCD
	chmod -x "$pkgdir"/usr/share/*/*.json
}
