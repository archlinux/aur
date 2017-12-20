# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
# Test URL: https://www.isign.io/chrome-extension-verify
pkgname=isign-chrome-signing
pkgver=1.2.7.0
pkgrel=1
pkgdesc="Google Chrome & Mozilla native smartcard plugin for isign.io & app.digidoc.ee"
url="https://www.isign.io/downloads"
depends=(openssl-1.0 qt5-base)
arch=(i686 x86_64)
source_i686=("https://www.isign.io/repo/${pkgver%.*}/isign-chrome-signing-en-32_${pkgver}.deb")
source_x86_64=("https://www.isign.io/repo/${pkgver%.*}/isign-chrome-signing-en_${pkgver}.deb")
sha256sums_i686=('c25c170ec36045f8e859509a2406242f1a8f2ed6877d70e891b04e0d75c6213e')
sha256sums_x86_64=('72f0ea73a9268ebbf47c22b3a7e7c457c4ad685e48f6304193caa220c5eb02b4')

prepare() {
	bsdtar xf data.tar.xz
}

package() {
	cp -av etc usr "$pkgdir"
	# OCD
	chmod -x "$pkgdir"/usr/share/*/*.json
}
