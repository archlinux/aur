# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
# Test URL: https://www.isign.io/chrome-extension-verify
pkgname=dokobit-plugin
pkgver=1.3.5.0
pkgrel=1
pkgdesc="Google Chrome & Mozilla native smartcard plugin for Dokobit (previously called isign-chrome-signing)"
url="https://www.dokobit.com/downloads"
depends=(openssl-1.0 qt5-base)
provides=(isign-chrome-signing=$pkgver)
replaces=(isign-chrome-signing)
conflicts=(isign-chrome-signing)
arch=(i686 x86_64)
source_i686=("https://www.dokobit.com/repo/${pkgver%.*}/dokobit-plugin-en-32_${pkgver}.deb")
source_x86_64=("https://www.dokobit.com/repo/${pkgver%.*}/dokobit-plugin-en_${pkgver}.deb")
sha256sums_i686=('16262ece73cee9a25c70eac6e8e7dc5f4f1e455b1565806b6ec52d870a5d215a')
sha256sums_x86_64=('a1c7e60942567daaf4b1ebfdb857ef2b91cc5f8fd22fb4961c03148855df1d7b')

prepare() {
	bsdtar xf data.tar.xz
}

package() {
	cp -av etc usr "$pkgdir"
	# OCD
	chmod -x "$pkgdir"/usr/share/*/*.json
}
